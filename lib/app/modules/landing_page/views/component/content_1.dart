

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/home_page/views/home_page_view.dart';

import '../../../../../app_color.dart';

class Content1 extends StatelessWidget {
  const Content1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Get Started
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 161, height: 77,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.5),
                        blurRadius: 10,
                        offset: Offset(4, 4)
                    )
                  ]
              ),
              child: Center(
                child: Text(
                  'POG', style: GoogleFonts.montserrat(color: AppColor.grey, fontSize: 50, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Organize ', style: GoogleFonts.montserrat(
                        color: AppColor.orange2,fontWeight: FontWeight.bold,fontSize: 48)),
                    Text('your association', style: GoogleFonts.montserrat(
                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 48)),
                  ],
                ),
                Text('better', style: GoogleFonts.montserrat(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 48)),
              ],
            ),
            SizedBox(height: 24),
            Text('Plan your events and reach out to more people ', style: GoogleFonts.montserrat(fontSize: 24, color: Colors.white)),
            SizedBox(height: 40),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                key: UniqueKey(),
                onTap: (){
                  Get.toNamed('/home-page');
                },
                child: Container(
                    width: 272,
                    height: 97,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(color: Colors.black, offset: Offset(10, 10))
                        ]
                    ),
                    child: Center(child: Text('GET STARTED', style: GoogleFonts.montserrat(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700)))),
              ),
            ),


          ],
        ),
        SizedBox(width: 20),
        //Photo
        Icon(Icons.ac_unit_rounded, size: 400, color: Colors.white),
      ],
    );
  }
}
