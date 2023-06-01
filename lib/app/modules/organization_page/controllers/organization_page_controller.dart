// ignore_for_file: unnecessary_overrides, avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pog/app/modules/profile/controllers/profile_controller.dart';
import 'package:pog/data/persons.dart';
import '../../../../data/organizations.dart';

class OrganizationPageController extends GetxController {
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
            'phone': phone
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
