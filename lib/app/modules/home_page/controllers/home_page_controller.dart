import 'dart:convert';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController {
  //TODO: Implement HomePageController

  final user = FirebaseAuth.instance.currentUser!;

  RxList userDetail = [].obs;

  Future fetchUser() async {
    final email = user.email;

    final response =
        await http.get(Uri.parse('http://localhost:8000/users/$email'));

    userDetail.value = jsonDecode(response.body);
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
