import 'package:carousel_widget_3d/carousel_widget_3d.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/landing_page/controllers/landing_controller.dart';
import 'package:pog/app_color.dart';

import 'landing_card.dart';

class Content2 extends GetView<LandingController>{
  const Content2({
    super.key,
    required this.width,
    required this.height
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: width,
      height: height,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("What's Happening?", style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 50, color: const Color.fromRGBO(46, 54, 62, 1))),
              const SizedBox(height: 40),
              Obx(() =>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          mouseCursor: SystemMouseCursors.click,
                          onTap: (){
                            controller.previousCard();
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColor.orange,
                            child: const Icon(Icons.arrow_back, color: Colors.white, size: 40,),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          height: 550,
                          child: Carousel3d(
                              displayRadius: 1,
                              center: controller.center.value,
                              items: List.generate(controller.title.length, (index){
                                return LandingCard(
                                    image: controller.images[index],
                                    title: controller.title[index],
                                    detail: controller.details[index]
                                );
                              })
                          ),
                        ),
                        InkWell(
                          mouseCursor: SystemMouseCursors.click,
                          onTap: (){
                            controller.nextCard();
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColor.orange,
                            child: const Icon(Icons.arrow_forward, color: Colors.white, size: 40,),
                          ),
                        ),
                      ],
                    )
              )

            ],
          ),
      ),
    );
  }
}

