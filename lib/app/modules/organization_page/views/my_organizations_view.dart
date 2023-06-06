import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/fast_snack.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/organization_page/controllers/organization_page_controller.dart';
import 'package:pog/data/app_color.dart';
import 'package:pog/data/persons.dart';
import 'package:pog/data/variable.dart';

class MyOrganizationsView extends GetView {
  const MyOrganizationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OrganizationPageController controller =
        Get.put(OrganizationPageController());

    final formKey = GlobalKey<FormBuilderState>();

    controller.fetchOrganization();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        title: const NavBar(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Gvar.bg), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const WhiteContainer(),
              const SizedBox(height: 30),
              //title
              Text(
                'YOUR ORGANIZATIONS',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                    color: AppColor.white),
              ),
              const SizedBox(height: 30),

              Obx(() => controller.memberOrganizations.isEmpty
                  ? Center(
                      child: SizedBox(
                          width: double.infinity,
                          height: 500,
                          child: Center(
                              child: Text(
                            'YOU HAVE NOT JOINED ANY ORGANIZATIONS',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 30, color: Colors.white),
                          ))),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(color: Colors.black, width: 2))),
                      width: 1000,
                      height: 400,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: controller.memberOrganizations.map((element) {
                          return MouseRegion(
                            cursor: MaterialStateMouseCursor.clickable,
                            child: GestureDetector(
                              onTap: () async {
                                await controller.selectOrganization(
                                    element['organization_id']);

                                Get.toNamed('/organization-page');
                              },
                              child: Container(
                                height: 200,
                                margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(Gvar.card_bg_2),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(70),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.3),
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: Offset(4, 4),
                                      ),
                                    ]),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(element['image_url']),
                                      radius: 80,
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          element['organization_name'],
                                          style: GoogleFonts.bebasNeue(
                                              fontSize: 30,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 700,
                                          child: Text(
                                              element['organization_desc'],
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )),

              const SizedBox(height: 20),

              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  key: UniqueKey(),
                  onTap: () {
                    Get.defaultDialog(
                        title: 'Enter Organization ID',
                        titleStyle: GoogleFonts.bebasNeue(
                            color: Colors.black, fontSize: 30),
                        contentPadding: const EdgeInsets.all(30),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FormBuilder(
                                key: formKey,
                                child: FormBuilderTextField(
                                  name: 'id',
                                  cursorColor: Colors.black,
                                  style: GoogleFonts.ibmPlexMono(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'ID',
                                    labelStyle: GoogleFonts.ibmPlexMono(
                                        fontWeight: FontWeight.w400),
                                    focusColor: AppColor.orange,
                                    floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                        color: AppColor.orange,
                                        fontWeight: FontWeight.w400),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColor.orange)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.black)),
                                  ),
                                )),
                            const SizedBox(height: 30),
                            ElevatedButton(
                                onPressed: () async {
                                  Person person = controller.thisUser.first;
                                  formKey.currentState!.saveAndValidate();

                                  String id = formKey.currentState!.value['id'];

                                  //checkin if textfield is valid
                                  if (formKey.currentState!.isValid) {
                                    //checking if org_id is exist
                                    if (controller.organizations.any(
                                        (element) =>
                                            element['organization_id'] == id)) {
                                      //checking if user is already registered

                                      if (controller.members.any((element) =>
                                          element['organization_id'] == id &&
                                          element['user_id'] ==
                                              person.user_id)) {
                                        FastSnack(
                                            'YOU ARE ALREADY IN THIS ORGANIZATION');
                                      } else {
                                        controller.joinOrganization(id);
                                      }
                                    } else {
                                      FastSnack('INVALID ID');
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.orange,
                                    fixedSize: const Size(130, 30),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                child: Text('JOIN',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15))),
                          ],
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, offset: Offset(6, 6)),
                        ]),
                    width: 250,
                    height: 60,
                    child: Center(
                      child: Text('JOIN ORGANIZATION',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}
