import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/admin/directory_v1.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:pog/app_color.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../data/persons.dart';
import '../../component/fast_snack.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final formKey = GlobalKey<FormBuilderState>();

  final user = FirebaseAuth.instance.currentUser!;

  RxList userDetail = [].obs;
  RxList<Person> thisUser = <Person>[].obs;

  Future fetchUser() async {
    final email = user.email;

    final response =
        await http.get(Uri.parse('http://localhost:8000/users/$email'));

    userDetail.value = jsonDecode(response.body);

    userDetail.forEach((json) {
      Person users = Person.fromJson(json);
      thisUser.add(users);
    });
  }

  void updateUser() async {
    Person person = thisUser.first;
    String user_id = person.user_id;

    String address = formKey.currentState!.value['address'];
    String birth_date = formKey.currentState!.value['birth_date'].toString();
    String phone_number = formKey.currentState!.value['phone'];
    String sex = formKey.currentState!.value['sex'];

    final response = await http.put(
      Uri.parse('http://localhost:8000/users/updateUser/$user_id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'address': address,
        'birth_date': birth_date,
        'phone_number': phone_number,
        'sex': sex,
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
