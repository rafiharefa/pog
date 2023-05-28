import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/events_page/views/component/events_content.dart';

import '../../../../app_color.dart';
import '../controllers/events_page_controller.dart';

class EventsPageView extends GetView<EventsPageController> {
  const EventsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        title: const NavBar(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WhiteContainer(),
              const SizedBox(height: 20),
              Text('Current Available Events',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 50, color: AppColor.white),
              ),

              const SizedBox(height: 30),

              const EventsContent(),
              const SizedBox(height: 40),

              const Footer()

            ],
          ),
        ),
      ),
    );
  }
}
