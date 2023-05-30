import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/fast_snack.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/organization_page/controllers/organization_page_controller.dart';
import 'package:pog/app_color.dart';
import 'package:pog/data/persons.dart';

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
        title: NavBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WhiteContainer(),
            const SizedBox(height: 20),
            //title
            Text(
              'Your Events',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 50,
                  color: AppColor.white),
            ),
            SizedBox(height: 20),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                key: UniqueKey(),
                onTap: () {
                  Get.defaultDialog(
                      title: 'Enter Organization ID',
                      titleStyle: GoogleFonts.bebasNeue(
                          color: Colors.black, fontSize: 30),
                      contentPadding: EdgeInsets.all(30),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FormBuilder(
                              key: formKey,
                              child: FormBuilderTextField(
                                name: 'id',
                                cursorColor: Colors.black,
                                style: GoogleFonts.ibmPlexMono(
                                    fontSize: 15, fontWeight: FontWeight.w400),
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
                          SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () async {
                                bool notError = false;
                                Person person = controller.thisUser.first;
                                formKey.currentState!.saveAndValidate();

                                String id = formKey.currentState!.value['id'];

                                //checkin if textfield is valid
                                if (formKey.currentState!.isValid) {
                                  //checking if org_id is exist
                                  if (controller.organizations.any((element) =>
                                      element['organization_id'] == id)) {
                                    //checking if user is already registered

                                    if (controller.members.any((element) =>
                                        element['organization_id'] == id &&
                                        element['user_id'] == person.user_id)) {
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
          ],
        ),
      ),
    );
  }
}
