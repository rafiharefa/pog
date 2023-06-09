import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/data/app_color.dart';

import '../../../../data/variable.dart';
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
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        title: LandingNavbar(),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(Gvar.card_bg_2, fit: BoxFit.cover),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Gvar.bg), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const WhiteContainer(),
                const SizedBox(height: 50),
                const Content1(),
                const SizedBox(height: 150),
                Content2(width: width, height: height),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
