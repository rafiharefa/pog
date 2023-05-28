import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/organization_page_controller.dart';

class OrganizationPageView extends GetView<OrganizationPageController> {
  const OrganizationPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrganizationPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OrganizationPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
