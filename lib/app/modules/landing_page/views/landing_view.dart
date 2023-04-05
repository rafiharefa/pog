import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app_color.dart';

import '../../component/footer.dart';
import '../../component/nav_bar.dart';
import '../controllers/landing_controller.dart';
import 'component/content_1.dart';
import 'component/content_2.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        title: NavBar(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Content1(),
              SizedBox(height: 150),
              Content2(width: width, height: height),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

