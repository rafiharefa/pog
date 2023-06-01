import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/organization_page/views/edit_organization_view.dart';
import 'package:pog/app_color.dart';

import '../controllers/home_page_controller.dart';
import 'component/detail_button.dart';
import 'component/home_content.dart';
import 'component/search_bar.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(EditOrganization());
      }),
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
              //title
              Text(
                'Your Events',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                    color: AppColor.white),
              ),
              const SizedBox(height: 25),
              //search bar
              const SearchBar(),
              const SizedBox(height: 30),
              //content
              const HomeContent(),
              const SizedBox(height: 40),
              //more detail button
              const DetailButton(),
              const SizedBox(height: 40),
              //footer
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
