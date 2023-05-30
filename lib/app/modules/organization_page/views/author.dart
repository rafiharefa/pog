// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/fast_snack.dart';
import 'package:pog/app/modules/organization_page/controllers/organization_page_controller.dart';
import 'package:pog/app/modules/organization_page/views/create_organization.dart';
import 'package:pog/data/organizations.dart';

import '../../../../app_color.dart';
import '../../component/footer.dart';

class AuthorView extends GetView<OrganizationPageController> {
  const AuthorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrganizationPageController controller =
        Get.put(OrganizationPageController());
    final formKey = GlobalKey<FormBuilderState>();

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
          icon: const Icon(
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
                    const BoxShadow(color: Colors.black, offset: Offset(8, 8))
                  ],
                  border: Border.all(width: 3, color: Colors.black),
                ),
                child: FormBuilder(
                  key: formKey,
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
                                  const EdgeInsets.symmetric(horizontal: 50),
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColor.orange)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
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
                                  const EdgeInsets.symmetric(horizontal: 50),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColor.orange)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.black)),
                            )),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            formKey.currentState!.saveAndValidate();

                            if (formKey.currentState!.isValid) {
                              await controller.selectOrganization(
                                  formKey.currentState!.value['id']);

                              if (controller.thisOrganization.isNotEmpty) {
                                Organization organization =
                                    controller.thisOrganization.first;
                                if (formKey.currentState!.value['key'] ==
                                    organization.organization_key) {
                                  controller.isAuthor.value = true;
                                  Get.toNamed('/organization-page');
                                } else {
                                  FastSnack('Invalid Organization ID or KEY');
                                  controller.thisOrganization.clear();
                                }
                              } else {
                                FastSnack('Invalid Organization ID or KEY');
                                controller.thisOrganization.clear();
                              }
                            } else {
                              controller.thisOrganization.clear();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.orange,
                              fixedSize: const Size(350, 50),
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
                              Get.off(const CreateOrganizationView());
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
              const SizedBox(height: 100),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
