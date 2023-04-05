import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/events_page_controller.dart';

class EventsPageView extends GetView<EventsPageController> {
  const EventsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventsPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EventsPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
