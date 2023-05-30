import 'package:get/get.dart';

import '../controllers/organization_page_controller.dart';

class OrganizationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrganizationPageController>(
      () => OrganizationPageController(),
    );
  }
}
