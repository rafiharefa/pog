// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:get/get.dart';
import 'package:pog/app/modules/events_page/controllers/events_page_controller.dart';
import 'package:http/http.dart' as http;
import 'package:pog/data/events.dart';

class LandingController extends GetxController {
  var center = 0.obs;

  RxList events = [].obs;
  RxList<Event> thisEvent = <Event>[].obs;

  Future fetchEvent() async {
    final response =
        await http.get(Uri.parse('https://api.pog.otech.id/events'));

    events.value = jsonDecode(response.body);

    for (var json in events) {
      Event event = Event.fromJson(json);
      thisEvent.add(event);
    }
  }

  void nextCard() {
    if (center.value < events.length) {
      center.value++;
    } else {
      center.value = 0;
      center.value++;
    }
  }

  void previousCard() {
    if (center.value > 0) {
      center.value--;
    } else {
      center.value = events.length;
      center.value--;
    }
  }

  final count = 0.obs;
  @override
  void onInit() async {
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
