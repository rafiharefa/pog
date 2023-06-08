// ignore_for_file: non_constant_identifier_names, unused_local_variable, unnecessary_overrides, avoid_print

import 'dart:async';

import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../data/persons.dart';
import '../../../../data/variable.dart';
import '../../component/fast_snack.dart';

class ProfileController extends GetxController {
  Uint8List? selectedImageBytes;
  RxString selectedFile = ''.obs;
  RxString imageUrl = ''.obs;

  RxBool isLoading = false.obs;

  selectFile() async {
    FilePickerResult? fileResult = await FilePicker.platform.pickFiles();

    if (fileResult != null) selectedFile.value = fileResult.files.first.name;

    selectedImageBytes = fileResult!.files.first.bytes;

    await uploadFile();
  }

  Future uploadFile() async {
    try {
      firebase_storage.UploadTask uploadTask;

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('users')
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

  final formKey = GlobalKey<FormBuilderState>();

  final user = FirebaseAuth.instance.currentUser!;

  RxList userDetail = [].obs;
  RxList<Person> thisUser = <Person>[].obs;

  Future fetchUser() async {
    final email = user.email;

    final response = await http.get(Uri.parse('${Gvar.url}/users/$email'));

    userDetail.value = jsonDecode(response.body);

    for (var json in userDetail) {
      Person users = Person.fromJson(json);
      thisUser.add(users);
    }
  }

  void updateUser() async {
    Person person = thisUser.first;
    String user_id = person.user_id;

    String image;

    if (imageUrl.value == '') {
      image = person.image_url;
    } else {
      image = imageUrl.value;
    }

    String address = formKey.currentState!.value['address'];
    String birth_date = formKey.currentState!.value['birth_date'].toString();
    String phone_number = formKey.currentState!.value['phone'];
    String sex = formKey.currentState!.value['sex'];

    final response = await http.put(
      Uri.parse('${Gvar.url}/users/updateUser/$user_id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'address': address,
        'birth_date': birth_date,
        'phone_number': phone_number,
        'sex': sex,
        'image_url': image
      }),
    );

    FastSnack('Changes Saved!');
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUser();
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
