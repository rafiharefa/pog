import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app_color.dart';

import '../../organization_page/views/component/org_card.dart';
import '../controllers/home_page_controller.dart';
import 'component/detail_button.dart';
import 'component/search_bar.dart';
import 'package:intl/intl.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.fetchUserEvents();
      }),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        title: const NavBar(),
      ),
      body: FutureBuilder(
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
                          const SizedBox(height: 20),
                          //title
                          Text(
                            'Your Events',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 50,
                                color: AppColor.white),
                          ),
                          const SizedBox(height: 25),
                          //search bar
                          const SearchBar(),
                          const SizedBox(height: 30),
                          //content

                          Container(
                            width: double.infinity,
                            height: 500,
                            child: Obx(
                              () => ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.userEvents.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return MouseRegion(
                                    cursor: MaterialStateMouseCursor.clickable,
                                    child: GestureDetector(
                                      onTap: () async {
                                        DateTime dateTime = DateTime.parse(
                                            controller.userEvents[index]
                                                ['event_date']);

                                        await controller.fetchApplicants();

                                        await controller
                                            .selectOrganization('ORG1');

                                        Get.defaultDialog(
                                          titlePadding: EdgeInsets.zero,
                                          contentPadding: EdgeInsets.zero,
                                          title: '',
                                          content: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                //id
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'ID',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        controller.userEvents[
                                                            index]['event_id'],
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Event Name',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        controller.userEvents[
                                                                index]
                                                            ['event_name'],
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Description',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        controller.userEvents[
                                                                index]
                                                            ['event_desc'],
                                                        maxLines: 5,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Date',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        DateFormat.yMMMMd()
                                                            .format(dateTime)
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Committees',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        controller
                                                            .userEvents[index][
                                                                'committee_amount']
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Participants',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        controller
                                                            .userEvents[index][
                                                                'participant_amount']
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Created By',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        controller
                                                                .organizationDetail
                                                                .first[
                                                            'organization_name'],
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
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
                                                      MainAxisAlignment.end,
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
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                      )),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      child: EventCard(
                                          image: controller.userEvents[index]
                                              ['image_url'],
                                          title: controller.userEvents[index]
                                              ['event_name'],
                                          detail: controller.userEvents[index]
                                              ['event_desc']),
                                    ),
                                  );
                                },
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
    );
  }
}
