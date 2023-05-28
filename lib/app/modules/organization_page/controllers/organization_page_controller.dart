// ignore_for_file: unnecessary_overrides, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrganizationPageController extends GetxController {
  RxList organizations = [].obs;

  Future fetchOrganization() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/organizations'));

    organizations.value = jsonDecode(response.body);
  }

  void createOrganization() async {
    fetchOrganization();

    final formK = formKey.currentState!.value;
    String key = formK['key'];
    String name = formK['name'];
    String desc = formK['desc'];
    String phone = formK['phone'];
    String email = formK['email'];
    String address = formK['address'];

    String id = 'ORG${organizations.length + 1}';

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
            'phone': phone
          }));

      if (response.statusCode == 200) {
        fetchOrganization();
      }
    } catch (e) {
      print('error: $e');
    }
  }

  final formKey = GlobalKey<FormBuilderState>();

  var whatScreen = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
