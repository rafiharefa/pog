import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/auth/controllers/auth_controller.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app_color.dart';


class RegisterView extends GetView<AuthController> {
  final width;
  final height;
  const RegisterView({Key? key, required this.width, required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context){

    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      extendBodyBehindAppBar: true,
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
              WhiteContainer(),
              Container(
                width: 500,
                height: 600,
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
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('SET UP ACCOUNT', style: GoogleFonts.ibmPlexMono(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w700)),
                      SizedBox(
                        width: 350,
                        height: 70,
                        child: FormBuilderTextField(
                            validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                            ]),
                            name: 'name',
                            cursorColor: Colors.black,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'name',
                              labelStyle: GoogleFonts.ibmPlexMono(fontWeight: FontWeight.w400),
                              focusColor: AppColor.orange,
                              floatingLabelStyle: GoogleFonts.ibmPlexMono(color: AppColor.orange,fontWeight: FontWeight.w400),
                              contentPadding: EdgeInsets.symmetric(horizontal: 50),
                              prefixIcon: Icon(Icons.person_outline, color: Colors.black,),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 1, color: AppColor.orange)
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 1, color: Colors.black)
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 350,
                        height: 70,
                        child: FormBuilderTextField(
                            validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.email(),
                            ]),
                            name: 'email',
                            cursorColor: Colors.black,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'email',
                              labelStyle: GoogleFonts.ibmPlexMono(fontWeight: FontWeight.w400),
                              focusColor: AppColor.orange,
                              floatingLabelStyle: GoogleFonts.ibmPlexMono(color: AppColor.orange,fontWeight: FontWeight.w400),
                              contentPadding: EdgeInsets.symmetric(horizontal: 50),
                              prefixIcon: Icon(Icons.email_outlined, color: Colors.black,),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 1, color: AppColor.orange)
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 1, color: Colors.black)
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 350,
                        height: 70,
                        child: FormBuilderTextField(
                            validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6,
                              errorText: 'Password must greater than 6'
                              ),
                            ]),
                            name: 'password',
                            cursorColor: Colors.black,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'password',
                              labelStyle: GoogleFonts.ibmPlexMono(fontWeight: FontWeight.w400),
                              focusColor: AppColor.orange,
                              floatingLabelStyle: GoogleFonts.ibmPlexMono(color: AppColor.orange,fontWeight: FontWeight.w400),
                              contentPadding: EdgeInsets.symmetric(horizontal: 50),
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.black,),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 1, color: AppColor.orange)
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 1, color: Colors.black)
                              ),
                            )),
                      ),
                      ElevatedButton(
                          onPressed: (){
                            _formKey.currentState?.saveAndValidate();
                            AuthController.instance.register(
                                _formKey.currentState!.value['email'],
                                _formKey.currentState!.value['password']
                            );
                          },
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
                          onPressed: (){
                            _formKey.currentState!.saveAndValidate();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size(350, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          ),
                          icon: Image.asset('assets/search.png', width: 20),
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

