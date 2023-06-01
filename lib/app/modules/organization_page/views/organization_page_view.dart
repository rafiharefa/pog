import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/organization_page/views/component/org_navbar.dart';
import 'package:pog/app_color.dart';
import 'package:pog/data/organizations.dart';

import '../controllers/organization_page_controller.dart';

class OrganizationPageView extends GetView<OrganizationPageController> {
  const OrganizationPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: controller.isAuthor.value == true ? OrgNavBar() : NavBar(),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WhiteContainer(),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 70, vertical: 70),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black, offset: Offset(10, 10))
                  ],
                  border: Border.all(width: 5, color: Colors.black),
                ),
                child: Obx(() {
                  Organization organization = controller.thisOrganization.first;
                  return Column(
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                            height: 350,
                          ),
                          Container(
                            width: double.infinity,
                            height: 200,
                            child: Image.network(
                              'https://images.unsplash.com/photo-1574169208507-84376144848b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=579&q=80',
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          Positioned(
                            top: 100,
                            child: CircleAvatar(
                              child: Icon(Icons.person_outline),
                              radius: 100,
                            ),
                          ),
                        ],
                      ),

                      Text(organization.organization_name,
                          style: GoogleFonts.bebasNeue(
                            color: Colors.black,
                            fontSize: 50,
                          )),
                      SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        width: double.infinity,
                        child: Text(organization.organization_desc,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(height: 30),
                      Text('CURRENT EVENTS',
                          style: GoogleFonts.bebasNeue(
                            color: Colors.black,
                            fontSize: 50,
                          )),

                      //PLACE EVENTS HERE!!!

                      SizedBox(height: 300),
                      Text('ADDRESS',
                          style: GoogleFonts.bebasNeue(
                            color: Colors.black,
                            fontSize: 50,
                          )),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        width: double.infinity,
                        child: Text(organization.organization_address,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ),

                      SizedBox(height: 30),
                      Text('CONTACT US',
                          style: GoogleFonts.bebasNeue(
                            color: Colors.black,
                            fontSize: 50,
                          )),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.email_outlined,
                                color: AppColor.orange,
                              ),
                              label: Text(organization.email,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))),
                          SizedBox(width: 10),
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.phone_outlined,
                                color: AppColor.orange,
                              ),
                              label: Text(organization.phone_number,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  );
                })),
            Footer()
          ],
        ),
      ),
    );
  }
}
