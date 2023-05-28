// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class LandingController extends GetxController {
  var center = 0.obs;

  List<String> images = [
    'assets/dummy1.png',
    'assets/dummy2.png',
    'assets/dummy3.png'
  ];
  List<String> title = [
    'OSSmosis',
    'UNHASHED: Demystifying the Blockchain',
    'Women in Tech',
  ];
  List<String> details = [
    'An online Speaker session presided by the leading Female Professionals in today’s World. We had Speakers from different parts of the world, doing ground-breaking work in different fields such as CyberSecurity, Aerospace, Ed-Tech, etc.',
    'An offline, hands-on Blockchain based Developing session on developing Smart Contracts through Zilliqa Blockchain. More than 400 people registered for the event. Developers were taught how to develop Smart Contracts using SCILLA.',
    'A hackathon, where participants submitted their Open-Source Software Development projects. developing Smart Contracts through Zilliqa Blockchain. More than 400 people registered for the event. Developers were taught how to develop',
  ];

  void nextCard() {
    if (center.value < title.length) {
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
      center.value = title.length;
      center.value--;
    }
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
