import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../views/author.dart';
import '../views/create_organization.dart';

class OrganizationPageController extends GetxController {
  //TODO: Implement OrganizationPageController

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
