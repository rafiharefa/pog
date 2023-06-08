// ignore_for_file: unnecessary_overrides, avoid_print, non_constant_identifier_names, avoid_web_libraries_in_flutter, unused_local_variable

import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:pog/app/modules/events_page/controllers/events_page_controller.dart';
import 'package:pog/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:pog/data/applications.dart';

import 'package:pog/data/persons.dart';
import '../../../../data/organizations.dart';
import '../../component/fast_snack.dart';

class OrganizationPageController extends GetxController {
  var center = 0.obs;

  Future deleteApplicant(String event_id) async {
    final response = await http.delete(Uri.parse(
        'http://localhost:8000/applications/deleteApplicant/$event_id'));
  }

  void deleteEvent(String event_id) async {
    await deleteApplicant(event_id);

    final response = await http.delete(
        Uri.parse('http://localhost:8000/events/deleteEvent/$event_id'));

    FastSnack('SUCCESSFULLY DELETE EVENT $event_id');
    applications.clear();
    fetchApplicants();
    organizationEvents.clear();
    fetchOrganizationEvents();
  }

  RxBool isClicked = false.obs;

  RxList<Applicants> thisApplicant = <Applicants>[].obs;
  RxList applications = [].obs;

  RxList totalApplicantString = [].obs;
  RxList totalApplicantRemovedString = [].obs;
  RxList<int> totalApplicantInt = <int>[].obs;
  RxInt lastApplicantId = 0.obs;

  Future fetchApplicants() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/applications'));

    applications.value = await jsonDecode(response.body);

    for (var json in applications) {
      Applicants applicants = Applicants.fromJson(json);
      thisApplicant.add(applicants);
    }

    if (applications.isEmpty) {
      lastApplicantId.value = 0;
    } else {
      totalApplicantString.value =
          applications.map((element) => element['application_id']).toList();
      totalApplicantString.forEach((element) {
        totalApplicantRemovedString
            .add(element.replaceAll(RegExp(r'[^0-9]'), ''));
      });
      totalApplicantRemovedString.forEach((element) {
        totalApplicantInt.add(int.tryParse(element) ?? 0);
      });
      lastApplicantId.value = totalApplicantInt
          .reduce((value, element) => value > element ? value : element);
    }
  }

  Future addApplicant(String event_id, String type) async {
    EventsPageController _ec = Get.put(EventsPageController());
    HomePageController _hc = Get.put(HomePageController());
    await fetchApplicants();

    String application_id = 'APP${lastApplicantId + 1}';

    Person person = thisUser.first;

    try {
      final response = await http.post(
          Uri.parse('http://localhost:8000/applications/insertApplicant'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            'application_id': application_id,
            'application_type': type,
            'user_id': person.user_id,
            'event_id': event_id,
          }));

      fetchApplicants();
      _hc.fetchUserEvents();

      FastSnack('SUCCESSFULLY REGISTER EVENT AS $type');
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateOrganization(String name, String desc, String address,
      String email, String phone) async {
    Organization organization = thisOrganization.first;
    String id = organization.organization_id;

    String image;

    if (imageUrl.value == '') {
      image = organization.image_url;
    } else {
      image = imageUrl.value;
    }

    final response = await http.put(
        Uri.parse('http://localhost:8000/organizations/updateOrganization/$id'),
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
    fetchOrganization().then((value) => FastSnack('CHANGES SAVED!'));
  }

  RxList organizationEvents = [].obs;

  Future fetchOrganizationEvents() async {
    Organization organization = thisOrganization.first;

    String organization_id = organization.organization_id;

    final response = await http
        .get(Uri.parse('http://localhost:8000/events/$organization_id'));

    organizationEvents.value = jsonDecode(response.body);
  }

  void nextCard() {
    if (center.value < organizationEvents.length) {
      center.value++;
    } else {
      center.value = 0;
      center.value++;
    }
  }

  void previousCard() {
    if (center.value > 0) {
      center.value--;
    } else {
      center.value = organizationEvents.length;
      center.value--;
    }
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
    await fetchUser();
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

    fetchMembers().then((value) => FastSnack('Successfully Joined'));
    fetchMemberOrganizations();
    Get.back();
  }

  RxList organizations = [].obs;
  RxList organizationDetail = [].obs;
  RxString temp_id = ''.obs;

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

    String image_url =
        'https://firebasestorage.googleapis.com/v0/b/piorganizer.appspot.com/o/assets%2Fdummy_card.jpg?alt=media&token=f1f5986a-a3da-4b8f-a450-75e8533f62af&_gl=1*1wpnn9p*_ga*MTQ1NjYxNTMxMC4xNjY0MTI0ODU3*_ga_CW55HF8NVT*MTY4NjEyODUzOC4zNy4xLjE2ODYxMzIwMzUuMC4wLjA.';

    String id = 'ORG${organizations.length + 1}';
    temp_id.value = id;

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
            'phone_number': phone,
            'image_url': image_url
          }));

      if (response.statusCode == 200) {
        await selectOrganization(id);
        Get.toNamed('/organization-page');

        FastSnack('Organization Created!');

        isAuthor.value = true;
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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    organizationEvents.value.clear();
  }

  void increment() => count.value++;
}
