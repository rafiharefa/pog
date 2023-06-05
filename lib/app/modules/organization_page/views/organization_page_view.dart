import 'package:carousel_widget_3d/carousel_widget_3d.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/fast_snack.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/organization_page/views/component/org_card.dart';
import 'package:pog/app/modules/organization_page/views/component/org_navbar.dart';
import 'package:pog/app_color.dart';
import 'package:pog/data/organizations.dart';
import 'package:intl/intl.dart';

import '../controllers/organization_page_controller.dart';

class OrganizationPageView extends GetView<OrganizationPageController> {
  const OrganizationPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: controller.isAuthor.value == true
            ? const OrgNavBar()
            : const NavBar(),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const WhiteContainer(),
            Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 70),
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
                          const SizedBox(
                            height: 350,
                          ),
                          SizedBox(
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
                              backgroundImage: organization.image_url.isNotEmpty
                                  ? NetworkImage(organization.image_url)
                                  : const NetworkImage(
                                      'https://img.freepik.com/free-icon/user_318-804790.jpg'),
                              radius: 100,
                              // ignore: unrelated_type_equality_checks
                              child: controller.isLoading == true
                                  ? const CircularProgressIndicator()
                                  : null,
                            ),
                          ),
                        ],
                      ),

                      Text(organization.organization_name,
                          style: GoogleFonts.bebasNeue(
                            color: Colors.black,
                            fontSize: 50,
                          )),
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        width: double.infinity,
                        child: Text(organization.organization_desc,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(height: 30),
                      Text('CURRENT EVENTS',
                          style: GoogleFonts.bebasNeue(
                            color: Colors.black,
                            fontSize: 50,
                          )),
                      const SizedBox(height: 30),

                      //PLACE EVENTS HERE!!!
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            mouseCursor: SystemMouseCursors.click,
                            onTap: () {
                              controller.previousCard();
                            },
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColor.orange,
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 550,
                            height: 600,
                            child: FutureBuilder(
                                future: controller.fetchOrganizationEvents(),
                                builder: (context, snapshot) {
                                  return snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Obx(() {
                                          Organization organization =
                                              controller.thisOrganization.first;

                                          return controller
                                                  .memberOrganizations.isEmpty
                                              ? Text(
                                                  'no data',
                                                  style: GoogleFonts.bebasNeue(
                                                      color: Colors.black),
                                                )
                                              : Carousel3d(
                                                  displayRadius: 1,
                                                  center:
                                                      controller.center.value,
                                                  items: List.generate(
                                                      controller
                                                          .organizationEvents
                                                          .length, (index) {
                                                    return MouseRegion(
                                                      cursor:
                                                          MaterialStateMouseCursor
                                                              .clickable,
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          DateTime dateTime =
                                                              DateTime.parse(
                                                                  controller.organizationEvents[
                                                                          index]
                                                                      [
                                                                      'event_date']);

                                                          await controller
                                                              .fetchApplicants();

                                                          Get.defaultDialog(
                                                            titlePadding:
                                                                EdgeInsets.zero,
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            title: '',
                                                            content: Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  //id
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'ID',
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w700,
                                                                              color: Colors.black,
                                                                              fontSize: 20),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          controller.organizationEvents[index]
                                                                              [
                                                                              'event_id'],
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                              fontSize: 15),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  //name
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Event Name',
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w700,
                                                                              color: Colors.black,
                                                                              fontSize: 20),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          controller.organizationEvents[index]
                                                                              [
                                                                              'event_name'],
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                              fontSize: 15),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),

                                                                  //desc
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Description',
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w700,
                                                                              color: Colors.black,
                                                                              fontSize: 20),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          controller.organizationEvents[index]
                                                                              [
                                                                              'event_desc'],
                                                                          maxLines:
                                                                              5,
                                                                          textAlign:
                                                                              TextAlign.justify,
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                              fontSize: 15),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),

                                                                  //date
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Date',
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w700,
                                                                              color: Colors.black,
                                                                              fontSize: 20),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          DateFormat.yMMMMd()
                                                                              .format(dateTime)
                                                                              .toString(),
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                              fontSize: 15),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),

                                                                  //comittee amount
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Committees',
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w700,
                                                                              color: Colors.black,
                                                                              fontSize: 20),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          controller
                                                                              .organizationEvents[index]['committee_amount']
                                                                              .toString(),
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                              fontSize: 15),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),

                                                                  //participant amount
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Participants',
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w700,
                                                                              color: Colors.black,
                                                                              fontSize: 20),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          controller
                                                                              .organizationEvents[index]['participant_amount']
                                                                              .toString(),
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                              fontSize: 15),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),

                                                                  //created by
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Created By',
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w700,
                                                                              color: Colors.black,
                                                                              fontSize: 20),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          organization
                                                                              .organization_name,
                                                                          style: GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                              fontSize: 15),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      //as participant

                                                                      Obx(
                                                                        () => controller.isClicked.value ==
                                                                                false
                                                                            ? AnimatedContainer(
                                                                                duration: Duration(milliseconds: 500),
                                                                                width: 120,
                                                                                height: 30,
                                                                                color: Colors.transparent,
                                                                              )
                                                                            : MouseRegion(
                                                                                cursor: SystemMouseCursors.click,
                                                                                child: GestureDetector(
                                                                                  onTap: () async {
                                                                                    controller.addApplicant(controller.organizationEvents[index]['event_id'], 'participant');

                                                                                    Get.back();
                                                                                  },
                                                                                  child: AnimatedContainer(
                                                                                    duration: Duration(milliseconds: 500),
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white, boxShadow: [
                                                                                      const BoxShadow(
                                                                                        color: Colors.black,
                                                                                        blurRadius: 2,
                                                                                        offset: Offset(2, 2),
                                                                                      )
                                                                                    ]),
                                                                                    width: 120,
                                                                                    height: 30,
                                                                                    child: Center(
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.ac_unit_outlined,
                                                                                            size: 20,
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                          SizedBox(
                                                                                            width: 5,
                                                                                          ),
                                                                                          Text(
                                                                                            'AS PARTICIPANT',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: GoogleFonts.bebasNeue(fontSize: 15, color: Colors.black),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            15,
                                                                      ),

                                                                      //as commit
                                                                      Obx(() {
                                                                        String user_id = controller
                                                                            .thisUser
                                                                            .first
                                                                            .user_id;
                                                                        String
                                                                            event_id =
                                                                            controller.organizationEvents[index]['event_id'];
                                                                        return controller.isAuthor.value ==
                                                                                true

                                                                            //is author
                                                                            ? MouseRegion(
                                                                                cursor: SystemMouseCursors.click,
                                                                                child: GestureDetector(
                                                                                  onTap: () {},
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black, boxShadow: [
                                                                                      const BoxShadow(
                                                                                        color: Colors.black,
                                                                                        blurRadius: 2,
                                                                                        offset: Offset(2, 2),
                                                                                      )
                                                                                    ]),
                                                                                    width: 120,
                                                                                    height: 30,
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        'Drop Event',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            : controller.applications.any((element) => element['user_id'] == user_id && element['event_id'] == event_id)
                                                                                ? Container(
                                                                                    color: AppColor.orange,
                                                                                    width: 100,
                                                                                    height: 20,
                                                                                    child: Center(
                                                                                        child: Text(
                                                                                      'REGISTERED',
                                                                                      style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700),
                                                                                    )),
                                                                                  )
                                                                                : controller.isClicked.value == false
                                                                                    ? MouseRegion(
                                                                                        cursor: SystemMouseCursors.click,
                                                                                        child: GestureDetector(
                                                                                          onTap: () async {
                                                                                            controller.isClicked.value = true;
                                                                                          },
                                                                                          child: AnimatedContainer(
                                                                                            duration: Duration(milliseconds: 1000),
                                                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColor.orange, boxShadow: [
                                                                                              const BoxShadow(
                                                                                                color: Colors.black,
                                                                                                blurRadius: 2,
                                                                                                offset: Offset(2, 2),
                                                                                              )
                                                                                            ]),
                                                                                            width: 120,
                                                                                            height: 30,
                                                                                            child: Center(
                                                                                              child: Text(
                                                                                                'Register',
                                                                                                textAlign: TextAlign.center,
                                                                                                style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    //as committee
                                                                                    : MouseRegion(
                                                                                        cursor: SystemMouseCursors.click,
                                                                                        child: GestureDetector(
                                                                                          onTap: () async {
                                                                                            controller.addApplicant(controller.organizationEvents[index]['event_id'], 'committee');
                                                                                            Get.back();
                                                                                          child: AnimatedContainer(
                                                                                            duration: Duration(milliseconds: 500),
                                                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black, boxShadow: [
                                                                                              const BoxShadow(
                                                                                                color: Colors.black,
                                                                                                blurRadius: 2,
                                                                                                offset: Offset(2, 2),
                                                                                              )
                                                                                            ]),
                                                                                            width: 120,
                                                                                            height: 30,
                                                                                            child: Center(
                                                                                              child: Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.ac_unit_outlined,
                                                                                                    size: 20,
                                                                                                    color: Colors.white,
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    width: 5,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'AS COMMITTEE',
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: GoogleFonts.bebasNeue(fontSize: 15, color: Colors.white),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                      }),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ).then((value) =>
                                                              controller
                                                                      .isClicked
                                                                      .value =
                                                                  false);
                                                        },
                                                        child: EventCard(
                                                            image: controller
                                                                        .organizationEvents[
                                                                    index]
                                                                ['image_url'],
                                                            title: controller
                                                                        .organizationEvents[
                                                                    index]
                                                                ['event_name'],
                                                            detail: controller
                                                                        .organizationEvents[
                                                                    index]
                                                                ['event_desc']),
                                                      ),
                                                    );
                                                  }));
                                        });
                                }),
                          ),
                          InkWell(
                            mouseCursor: SystemMouseCursors.click,
                            onTap: () {
                              controller.nextCard();
                            },
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColor.orange,
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      Text('ADDRESS',
                          style: GoogleFonts.bebasNeue(
                            color: Colors.black,
                            fontSize: 50,
                          )),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        width: double.infinity,
                        child: Text(organization.organization_address,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ),

                      const SizedBox(height: 30),
                      Text('CONTACT US',
                          style: GoogleFonts.bebasNeue(
                            color: Colors.black,
                            fontSize: 50,
                          )),
                      const SizedBox(height: 10),
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
                          const SizedBox(width: 10),
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
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  );
                })),
            const Footer()
          ],
        ),
      ),
    );
  }
}
