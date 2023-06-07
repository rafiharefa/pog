import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/auth/controllers/auth_controller.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/data/app_color.dart';
import 'package:pog/data/variable.dart';

import '../../organization_page/views/component/org_card.dart';
import '../controllers/home_page_controller.dart';
import 'component/detail_button.dart';
import 'component/search_bar.dart';
import 'package:intl/intl.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    HomePageController controller = Get.put(HomePageController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const NavBar(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: NetworkImage(Gvar.bg), fit: BoxFit.cover)),
        child: FutureBuilder(
            future: controller.fetchUserEvents(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const WhiteContainer(),
                            const SizedBox(height: 30),
                            //title
                            Text(
                              'YOUR EVENTS',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 50,
                                  color: AppColor.white),
                            ),
                            //search bar
                            const SizedBox(height: 30),
                            //content

                            Obx(
                              () => controller.userEvents.isEmpty
                                  ? SizedBox(
                                      width: double.infinity,
                                      height: 500,
                                      child: Center(
                                          child: Text(
                                        'NO EVENTS ARE REGISTERED!',
                                        style: GoogleFonts.bebasNeue(
                                            fontSize: 30, color: Colors.white),
                                      )))
                                  : Container(
                                      width: 1095,
                                      height: 500,
                                      decoration: BoxDecoration(
                                          border: Border.symmetric(
                                              vertical: BorderSide(
                                                  width: 2,
                                                  color: Colors.black,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignInside))),
                                      child: Container(
                                        width: double.infinity,
                                        height: 500,
                                        child: Obx(
                                          () => Scrollbar(
                                            controller: _scrollController,
                                            child: ListView.builder(
                                              controller: _scrollController,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  controller.userEvents.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return MouseRegion(
                                                  cursor:
                                                      MaterialStateMouseCursor
                                                          .clickable,
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      await controller
                                                          .selectOrganization();

                                                      List organizations = controller
                                                          .organizationDetail
                                                          .where((element) =>
                                                              element[
                                                                  'organization_id'] ==
                                                              controller.userEvents[
                                                                      index][
                                                                  'organization_id'])
                                                          .toList();

                                                      String organization_name =
                                                          organizations.first[
                                                              'organization_name'];

                                                      DateTime dateTime = DateTime
                                                          .parse(controller
                                                                      .userEvents[
                                                                  index]
                                                              ['event_date']);

                                                      await controller
                                                          .fetchApplicants();

                                                      EventDetail(
                                                          index,
                                                          dateTime,
                                                          organization_name);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          .3),
                                                                  blurRadius: 5,
                                                                  spreadRadius:
                                                                      2,
                                                                  offset:
                                                                      Offset(
                                                                          4, 4),
                                                                ),
                                                              ]),
                                                          child: EventCard(
                                                              image: controller
                                                                          .userEvents[
                                                                      index]
                                                                  ['image_url'],
                                                              title: controller
                                                                          .userEvents[
                                                                      index][
                                                                  'event_name'],
                                                              detail: controller
                                                                          .userEvents[
                                                                      index][
                                                                  'event_desc']),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),

                            const SizedBox(height: 40),
                            //more detail button
                            const DetailButton(),
                            const SizedBox(height: 40),
                            //footer
                            const Footer(),
                          ],
                        ),
                      ),
                    );
            }),
      ),
    );
  }

  Future<dynamic> EventDetail(
      int index, DateTime dateTime, String organization_name) {
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
                    controller.userEvents[index]['event_id'],
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
                    controller.userEvents[index]['event_name'],
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
                    controller.userEvents[index]['event_desc'],
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
                    controller.userEvents[index]['committee_amount'].toString(),
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
                    controller.userEvents[index]['participant_amount']
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

                //as commit
                Container(
                  color: AppColor.orange,
                  width: 100,
                  height: 20,
                  child: Center(
                      child: Text(
                    'REGISTERED',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
