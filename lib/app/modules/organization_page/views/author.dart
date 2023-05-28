import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/auth/controllers/auth_controller.dart';
import 'package:pog/app/modules/auth/views/auth_view.dart';
import 'package:pog/app/modules/auth/views/register_view.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/organization_page/controllers/organization_page_controller.dart';
import 'package:pog/app/modules/organization_page/views/create_organization.dart';

import '../../../../app_color.dart';
import '../../component/footer.dart';

class AuthorView extends GetView<OrganizationPageController> {
  const AuthorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 100),
              Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black, offset: Offset(8, 8))
                  ],
                  border: Border.all(width: 3, color: Colors.black),
                ),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('HI AUTHOR!',
                          style: GoogleFonts.ibmPlexMono(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                      Text('Enter Your Organization ID and KEY',
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        width: 350,
                        height: 70,
                        child: FormBuilderTextField(
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            name: 'id',
                            cursorColor: Colors.black,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Organization ID',
                              labelStyle: GoogleFonts.ibmPlexMono(
                                  fontWeight: FontWeight.w400),
                              focusColor: AppColor.orange,
                              floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                  color: AppColor.orange,
                                  fontWeight: FontWeight.w400),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 50),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColor.orange)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                            )),
                      ),
                      SizedBox(
                        width: 350,
                        height: 70,
                        child: FormBuilderTextField(
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            name: 'key',
                            obscureText: true,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: 'Organization Key',
                              labelStyle: GoogleFonts.ibmPlexMono(
                                  fontWeight: FontWeight.w400),
                              focusColor: AppColor.orange,
                              floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                  color: AppColor.orange,
                                  fontWeight: FontWeight.w400),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 50),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColor.orange)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                            )),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.saveAndValidate();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.orange,
                              fixedSize: Size(350, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text('ENTER',
                              style: GoogleFonts.ibmPlexMono(
                                  fontWeight: FontWeight.w600, fontSize: 20))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Create You Own Organization?",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                          TextButton(
                            onPressed: () {
                              Get.off(CreateOrganizationView());
                            },
                            child: Text('CLICK HERE',
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700)),
                          )
                        ],
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
