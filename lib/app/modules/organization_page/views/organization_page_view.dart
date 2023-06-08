// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:carousel_widget_3d/carousel_widget_3d.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/organization_page/views/component/org_card.dart';
import 'package:pog/app/modules/organization_page/views/component/org_navbar.dart';
import 'package:pog/data/app_color.dart';
import 'package:intl/intl.dart';

import '../../../../data/variable.dart';
import '../controllers/organization_page_controller.dart';

class OrganizationPageView extends GetView<OrganizationPageController> {
  const OrganizationPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final organization = controller.thisOrganization.first;
    return Scaffold(
      backgroundColor: AppColor.grey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: controller.isAuthor.value == true
            ? const OrgNavBar()
            : const NavBar(),
        automaticallyImplyLeading: false,
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
                  child: Column(
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
                              'https://firebasestorage.googleapis.com/v0/b/piorganizer.appspot.com/o/assets%2Florenzo-herrera-p0j-mE6mGo4-unsplash.jpg?alt=media&token=e3f1d1be-f361-44ac-b94e-ab1d9b8eb8cf&_gl=1*swuu6u*_ga*MTQ1NjYxNTMxMC4xNjY0MTI0ODU3*_ga_CW55HF8NVT*MTY4NjA4MDg2NC4zNS4xLjE2ODYwODgwMTkuMC4wLjA.',
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
                                      'https://firebasestorage.googleapis.com/v0/b/piorganizer.appspot.com/o/assets%2Fdummy_card.jpg?alt=media&token=f1f5986a-a3da-4b8f-a450-75e8533f62af&_gl=1*1wpnn9p*_ga*MTQ1NjYxNTMxMC4xNjY0MTI0ODU3*_ga_CW55HF8NVT*MTY4NjEyODUzOC4zNy4xLjE2ODYxMzIwMzUuMC4wLjA.'),
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
                                  final organization =
                                      controller.thisOrganization.first;
                                  return snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : controller.organizationEvents.isEmpty
                                          ? SizedBox(
                                              width: double.infinity,
                                              height: 100,
                                              child: Center(
                                                child: Text(
                                                  'NO EVENTS FROM THIS ORGANIZATION',
                                                  style: GoogleFonts.bebasNeue(
                                                      color: Colors.black,
                                                      fontSize: 30),
                                                ),
                                              ),
                                            )
                                          : Obx(
                                              () => Carousel3d(
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
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      // color: Colors
                                                                      //     .white,
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(Gvar
                                                                              .card_bg_2),
                                                                          fit: BoxFit
                                                                              .cover)),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  //id
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
                                                                  const SizedBox(
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
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  //name
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
                                                                  const SizedBox(
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
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),

                                                                  //desc
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
                                                                  const SizedBox(
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
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),

                                                                  //date
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
                                                                  const SizedBox(
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
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),

                                                                  //comittee amount
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
                                                                  const SizedBox(
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
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),

                                                                  //participant amount
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
                                                                  const SizedBox(
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
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),

                                                                  //created by
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
                                                                  const SizedBox(
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
                                                                  const SizedBox(
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
                                                                                duration: const Duration(milliseconds: 500),
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
                                                                                    duration: const Duration(milliseconds: 500),
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white, boxShadow: const [
                                                                                      BoxShadow(
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
                                                                                          const Icon(
                                                                                            Icons.ac_unit_outlined,
                                                                                            size: 20,
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                          const SizedBox(
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
                                                                      const SizedBox(
                                                                        width:
                                                                            15,
                                                                      ),

                                                                      //as commit

                                                                      Obx(
                                                                        () => controller.isAuthor.value ==
                                                                                true

                                                                            //is author
                                                                            ? MouseRegion(
                                                                                cursor: SystemMouseCursors.click,
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    String event_id = controller.organizationEvents[index]['event_id'];
                                                                                    controller.deleteEvent(event_id);
                                                                                    Get.back();
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black, boxShadow: const [
                                                                                      BoxShadow(
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
                                                                            : controller.applications.any((element) => element['user_id'] == controller.thisUser.first.user_id && element['event_id'] == controller.organizationEvents[index]['event_id'])
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
                                                                                            duration: const Duration(milliseconds: 1000),
                                                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColor.orange, boxShadow: const [
                                                                                              BoxShadow(
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
                                                                                            },
                                                                                            child: AnimatedContainer(
                                                                                              duration: const Duration(milliseconds: 500),
                                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black, boxShadow: const [
                                                                                                BoxShadow(
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
                                                                                                    const Icon(
                                                                                                      Icons.ac_unit_outlined,
                                                                                                      size: 20,
                                                                                                      color: Colors.white,
                                                                                                    ),
                                                                                                    const SizedBox(
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
                                                                                            )),
                                                                                      ),
                                                                      )
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
                                                  })),
                                            );
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
                  )),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}
