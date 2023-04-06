import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/auth/controllers/auth_controller.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app_color.dart';

import 'component/custom_text_field.dart';

class RegisterView extends GetView<AuthController> {
  final width;
  final height;
  const RegisterView({Key? key, required this.width, required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white ,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(8, 8)
                    )
                  ],
                  border: Border.all(width: 3, color: Colors.black),
                ),
                child: FormBuilder(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('SET UP ACCOUNT', style: GoogleFonts.ibmPlexMono(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w700)),
                      CustomTextField(name: controller.textfield[0], icon: Icons.person_outline),
                      CustomTextField(name: controller.textfield[1], icon: Icons.email_outlined),
                      CustomTextField(name: controller.textfield[2], icon: Icons.lock_outline, obscure: true),
                      ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.orange,
                            fixedSize: Size(350, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              )
                            ),
                          child: Text('SIGN UP', style: GoogleFonts.ibmPlexMono(fontWeight: FontWeight.w600, fontSize: 20))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 157,
                            height: 1,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text('OR', style: GoogleFonts.ibmPlexMono(color: Colors.black,fontWeight: FontWeight.w400, fontSize: 20)),
                          SizedBox(width: 5),
                          Container(
                            width: 157,
                            height: 1,
                            color: Colors.black,
                          ),

                        ],
                      ),
                      ElevatedButton.icon(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size(350, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          ),
                          icon: Image.asset('search.png', width: 20),
                          label: Text(' GOOGLE SIGN UP', style: GoogleFonts.ibmPlexMono(color: Colors.black ,fontWeight: FontWeight.w600, fontSize: 20))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w400)),
                          TextButton(
                            onPressed: (){
                              controller.toggleScreen();
                            },
                            child: Text('SIGN IN', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700)), )],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

