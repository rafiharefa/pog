import 'package:get/get.dart';

import '../controllers/events_page_controller.dart';

class EventsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventsPageController>(
      () => EventsPageController(),
    );
  }
}
