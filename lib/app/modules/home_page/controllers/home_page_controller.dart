// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member, non_constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:pog/app/modules/profile/controllers/profile_controller.dart';
import 'package:pog/data/persons.dart';
import 'package:http/http.dart' as http;


class HomePageController extends GetxController {
  ProfileController profileController = Get.put(ProfileController());
  RxList userEvents = [].obs;

  RxList organizationDetail = [].obs;
  RxList<Person> thisUser = <Person>[].obs;
  RxList applications = [].obs;

  Future fetchApplicants() async {
    final response =
        await http.get(Uri.parse('https://api.pog.otech.id/applications'));

    applications.value = jsonDecode(response.body);
  }

  Future selectOrganization() async {
    final response =
        await http.get(Uri.parse('https://api.pog.otech.id/organizations'));

    organizationDetail.value = jsonDecode(response.body);
  }

  Future fetchUserEvents() async {
    await profileController.fetchUser();
    thisUser.value = profileController.thisUser.value;

    String user_id = thisUser.first.user_id;

    final response = await http
        .get(Uri.parse('https://api.pog.otech.id/applications/$user_id'));

    userEvents.value = jsonDecode(response.body);
  }

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
