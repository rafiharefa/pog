import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/events_page/views/component/events_content.dart';
import 'package:pog/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:intl/intl.dart';
import 'package:pog/app/modules/organization_page/controllers/organization_page_controller.dart';

import '../../../../data/app_color.dart';
import '../../../../data/variable.dart';
import '../../organization_page/views/component/org_card.dart';
import '../controllers/events_page_controller.dart';

class EventsPageView extends GetView<EventsPageController> {
  const EventsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomePageController hc = Get.put(HomePageController());
    OrganizationPageController oc = Get.put(OrganizationPageController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        title: const NavBar(),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Gvar.bg), fit: BoxFit.cover)),
        child: FutureBuilder(
            future: controller.fetchUnRegisteredEvents(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const WhiteContainer(),
                            const SizedBox(height: 30),
                            Text(
                              'AVAILABLE EVENTS FOR YOU',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 50,
                                  color: AppColor.white),
                            ),
                            const SizedBox(height: 30),
                            Obx(() {
                              return controller.unreg_events.isEmpty
                                  ? SizedBox(
                                      width: double.infinity,
                                      height: 500,
                                      child: Center(
                                        child: Text('NO EVENTS ARE AVAILABLE',
                                            style: GoogleFonts.bebasNeue(
                                                fontSize: 30,
                                                color: Colors.white)),
                                      ),
                                    )
                                  : Container(
                                      width: 1200,
                                      height: 500,
                                      child: CustomScrollView(
                                        slivers: <Widget>[
                                          SliverGrid.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisSpacing:
                                                    10.0, // Spasi vertikal antara item
                                                crossAxisSpacing:
                                                    10.0, // Spasi horizontal antara item
                                                childAspectRatio: .79,
                                              ),
                                              itemCount: controller
                                                  .unreg_events.length,
                                              itemBuilder:
                                                  (context, index) =>
                                                      MouseRegion(
                                                        cursor:
                                                            MaterialStateMouseCursor
                                                                .clickable,
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            await hc
                                                                .selectOrganization();

                                                            List organizations = hc
                                                                .organizationDetail
                                                                .where((element) =>
                                                                    element[
                                                                        'organization_id'] ==
                                                                    controller.unreg_events[
                                                                            index]
                                                                        [
                                                                        'organization_id'])
                                                                .toList();

                                                            String
                                                                organization_name =
                                                                organizations
                                                                        .first[
                                                                    'organization_name'];

                                                            DateTime dateTime =
                                                                DateTime.parse(
                                                                    controller.unreg_events[
                                                                            index]
                                                                        [
                                                                        'event_date']);

                                                            await hc
                                                                .fetchApplicants();

                                                            EventDetail(
                                                                index,
                                                                dateTime,
                                                                organization_name,
                                                                hc,
                                                                oc);
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(.3),
                                                                        blurRadius:
                                                                            5,
                                                                        spreadRadius:
                                                                            2,
                                                                        offset: Offset(
                                                                            4,
                                                                            4),
                                                                      ),
                                                                    ]),
                                                                child: EventCard(
                                                                    image: controller
                                                                            .unreg_events[index]
                                                                        [
                                                                        'image_url'],
                                                                    title: controller
                                                                            .unreg_events[index]
                                                                        [
                                                                        'event_name'],
                                                                    detail: controller
                                                                            .unreg_events[index]
                                                                        [
                                                                        'event_desc']),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                        ],
                                      ),
                                    );
                            }),
                            const SizedBox(height: 30),
                            const Footer()
                          ],
                        ),
                      ),
                    );
            }),
      ),
    );
  }

  Future<dynamic> EventDetail(
      int index,
      DateTime dateTime,
      String organization_name,
      HomePageController hc,
      OrganizationPageController oc) {
    return Get.defaultDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: '',
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Gvar.card_bg_2), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //id
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.unreg_events[index]['event_id'],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Event Name',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.unreg_events[index]['event_name'],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.unreg_events[index]['event_desc'],
                    maxLines: 5,
                    textAlign: TextAlign.justify,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    DateFormat.yMMMMd().format(dateTime).toString(),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Committees',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.unreg_events[index]['committee_amount']
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Participants',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.unreg_events[index]['participant_amount']
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Created By',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    organization_name,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //as participant

                Obx(
                  () => controller.isClicked.value == false
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
                              oc.addApplicant(
                                  controller.unreg_events[index]['event_id'],
                                  'participant');
                              Get.back();
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2,
                                      offset: Offset(2, 2),
                                    )
                                  ]),
                              width: 130,
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
                                      style: GoogleFonts.bebasNeue(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  width: 15,
                ),

                //as commit
                Obx(() {
                  String user_id = hc.thisUser.first.user_id;
                  String event_id = controller.unreg_events[index]['event_id'];
                  return controller.isClicked.value == false
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () async {
                              controller.isClicked.value = true;
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 1000),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.orange,
                                  boxShadow: [
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
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
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
                                oc.addApplicant(
                                    controller.unreg_events[index]['event_id'],
                                    'committee');

                                Get.back();
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black,
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 2,
                                        offset: Offset(2, 2),
                                      )
                                    ]),
                                width: 130,
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
                                        style: GoogleFonts.bebasNeue(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        );
                }),
              ],
            )
          ],
        ),
      ),
    ).then((value) {
      controller.isClicked.value = false;
    });
  }
}
