import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app_color.dart';

import '../controllers/home_page_controller.dart';
import 'component/detail_button.dart';
import 'component/home_content.dart';
import 'component/search_bar.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        title: NavBar(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              //title
              Text("Events you've registered",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 50, color: AppColor.white),
              ),
              SizedBox(height: 25),
              //search bar
              SearchBar(),
              SizedBox(height: 30),
              //content
              HomeContent(),
              SizedBox(height: 40),
              //more detail button
              DetailButton(),
              SizedBox(height: 40),
              //footer
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}



