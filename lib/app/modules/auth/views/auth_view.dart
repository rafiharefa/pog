import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pog/app/modules/auth/views/login_view.dart';
import 'package:pog/app/modules/auth/views/register_view.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width =  MediaQuery.of(context).size.width;
    var height =  MediaQuery.of(context).size.height;
    return Obx(() => controller.whatScreen.value == true ?
    RegisterView(width: width, height: height) : LoginView(width: width, height: height));
  }
}
