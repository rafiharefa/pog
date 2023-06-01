// ignore_for_file: unnecessary_overrides, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:pog/data/persons.dart';
import '../../../../data/organizations.dart';
import '../../component/fast_snack.dart';

class OrganizationPageController extends GetxController {
  Future<void> updateOrganization(String name, String desc, String address,
      String email, String phone) async {
    Organization organization = thisOrganization.first;
    String image_url = imageUrl.value;
    String id = organization.organization_id;

    String image;

    if (imageUrl.value == '') {
      image = organization.image_url;
    } else {
      image = imageUrl.value;
    }

    final response = await http.put(
        Uri.parse(
            'http://localhost:8000/organizations/updateOrganization/${id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'organization_name': name,
          'organization_desc': desc,
          'organization_address': address,
          'email': email,
          'phone_number': phone,
          'image_url': image
        }));
    FastSnack('CHANGES SAVED!');
  }

  Uint8List? selectedImageBytes;
  RxString selectedFile = ''.obs;
  RxString imageUrl = ''.obs;
  RxBool isLoading = false.obs;

  selectFile() async {
    FilePickerResult? fileResult = await FilePicker.platform.pickFiles();

    if (fileResult != null) selectedFile.value = fileResult.files.first.name;

    selectedImageBytes = fileResult!.files.first.bytes;

    uploadFile();
  }

  void refreshPage() {
    html.window.location.reload();
  }

  Future uploadFile() async {
    try {
      firebase_storage.UploadTask uploadTask;

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('organizations')
          .child('/${selectedFile.value}');

      final metadata =
          firebase_storage.SettableMetadata(contentType: 'image/jpeg');

      uploadTask = ref.putData(selectedImageBytes!, metadata);
      isLoading.value = true;
      await uploadTask.whenComplete(() => isLoading.value = false);
      imageUrl.value = await ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  RxList<Person> thisUser = <Person>[].obs;
  final user = FirebaseAuth.instance.currentUser!;

  RxList userDetail = [].obs;

  Future fetchUser() async {
    final email = user.email;

    final response =
        await http.get(Uri.parse('http://localhost:8000/users/$email'));

    userDetail.value = jsonDecode(response.body);

    for (var json in userDetail) {
      Person users = Person.fromJson(json);
      thisUser.add(users);
    }
  }

  RxList members = [].obs;
  RxList memberOrganizations = [].obs;

  //fetching organizations data that user registered
  Future fetchMemberOrganizations() async {
    String user_id;
    user_id = thisUser.first.user_id;
    final response = await http
        .get(Uri.parse('http://localhost:8000/members/organizations/$user_id'));

    memberOrganizations.value = jsonDecode(response.body);
  }

  Future fetchMembers() async {
    final response = await http.get(Uri.parse('http://localhost:8000/members'));

    members.value = jsonDecode(response.body);
  }

  void joinOrganization(String organization_id) async {
    Person person = thisUser.first;

    String member_id = 'MEM${members.length + 1}';

    final response =
        await http.post(Uri.parse('http://localhost:8000/members/insertMember'),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({
              'member_id': member_id,
              'user_id': person.user_id,
              'organization_id': organization_id
            }));

    fetchMembers();
  }

  RxList organizations = [].obs;
  RxList organizationDetail = [].obs;
  String temp_id = '';

  RxBool isAuthor = false.obs;

  Future fetchOrganization() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/organizations'));

    organizations.value = jsonDecode(response.body);
  }

  void createOrganization() async {
    final formK = formKey.currentState!.value;
    String key = formK['key'];
    String name = formK['name'];
    String desc = formK['desc'];
    String phone = formK['phone'];
    String email = formK['email'];
    String address = formK['address'];

    String image_url = 'https://img.freepik.com/free-icon/user_318-804790.jpg';

    String id = 'ORG${organizations.length + 1}';
    temp_id = id;

    try {
      final response = await http.post(
          Uri.parse('http://localhost:8000/organizations/createOrganization'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            'organization_id': id,
            'organization_key': key,
            'organization_name': name,
            'organization_desc': desc,
            'organization_address': address,
            'email': email,
            'phone': phone,
            'image_url': image_url
          }));

      if (response.statusCode == 200) {
        fetchOrganization();
      }
    } catch (e) {
      print('error: $e');
    }
  }

  RxList<Organization> thisOrganization = <Organization>[].obs;

  Future selectOrganization(String organization_id) async {
    final response = await http
        .get(Uri.parse('http://localhost:8000/organizations/$organization_id'));

    organizationDetail.value = jsonDecode(response.body);

    for (var json in organizationDetail) {
      Organization organization = Organization.fromJson(json);
      thisOrganization.clear();
      thisOrganization.insert(0, organization);
    }
  }

  final formKey = GlobalKey<FormBuilderState>();

  var whatScreen = false.obs;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await fetchUser();
    fetchMemberOrganizations();
    fetchMembers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
