import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app_color.dart';

import '../../component/footer.dart';
import '../controllers/home_controller.dart';
import 'component/content_1.dart';
import 'component/content_2.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Icon(Icons.ac_unit_rounded, color:  Colors.black, size: 60)),

            Expanded(
              child: Row(
                children: [
                  TextButton(onPressed: (){}, child: Text('About Us', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))),
                  SizedBox(width: 20),
                  TextButton(onPressed: (){}, child: Text('Events', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20))),
                  SizedBox(width: 20),
                  TextButton(onPressed: (){}, child: Text('Author', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20))),
                  SizedBox(width: 20),
                  TextButton(onPressed: (){}, child: Text('Contact Us', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20))),
                ],
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Content1(),
              SizedBox(height: 150),
              Content2(width: width),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
