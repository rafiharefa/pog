import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pog/app/modules/auth/views/login_view.dart';
import 'package:pog/app/modules/auth/views/register_view.dart';
import 'package:pog/app/modules/home_page/views/home_page_view.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    if (user == null) {
      return Obx(() => controller.whatScreen.value == true
          ? RegisterView(width: width, height: height)
          : LoginView(width: width, height: height));
    } else {
      return Get.put(HomePageView());
    }
  }
}
