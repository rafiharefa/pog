import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/events_page/views/create_event_view.dart';
import 'package:pog/app/modules/organization_page/controllers/organization_page_controller.dart';
import 'package:pog/app/modules/organization_page/views/edit_organization_view.dart';
import 'package:pog/data/organizations.dart';
import 'package:pog/data/variable.dart';

class OrgNavBar extends StatelessWidget {
  const OrgNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OrganizationPageController controller =
        Get.put(OrganizationPageController());

    Organization organization = controller.thisOrganization.first;

    return Row(
      children: [
        Expanded(
            child: IconButton(
                onPressed: () {
                  Get.offAllNamed('/landing');
                },
                iconSize: 60,
                icon: Image.network(
                  Gvar.logo1,
                  color: Colors.black,
                ))),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  key: UniqueKey(),
                  onPressed: () {
                    Get.to(const CreateEventView());
                  },
                  child: Text('CREATE EVENT',
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              const SizedBox(width: 20),
              TextButton(
                  key: UniqueKey(),
                  onPressed: () {
                    Get.to(const EditOrganization());
                  },
                  child: Text('EDIT ORGANIZATION',
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              const SizedBox(width: 20),
              TextButton(
                  key: UniqueKey(),
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'ORGANIZATION ID AND KEY',
                        titleStyle: GoogleFonts.bebasNeue(
                            color: Colors.black, fontSize: 30),
                        contentPadding: const EdgeInsets.all(20),
                        middleText:
                            'ID : ${organization.organization_id} - KEY : ${organization.organization_key}',
                        middleTextStyle: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.w500));
                  },
                  child: Text('SHARE AUTHOR',
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              const SizedBox(width: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  key: UniqueKey(),
                  onPressed: () {
                    Get.offAllNamed('/home-page');
                    controller.isAuthor.value = false;
                  },
                  child: Text('EXIT AUTHOR',
                      style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
            ],
          ),
        )
      ],
    );
  }
}

class LandingNavbar extends StatelessWidget {
  const LandingNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: IconButton(
                onPressed: () {
                  Get.offAllNamed('/landing');
                },
                iconSize: 60,
                icon: const Icon(
                  Icons.ac_unit_rounded,
                  color: Colors.black,
                ))),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  key: UniqueKey(),
                  onPressed: () {
                    Get.toNamed('/auth');
                  },
                  child: Text('SIGN IN',
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              const SizedBox(width: 20),
              PopupMenuButton(
                  child: Row(children: [
                    Text('ORGANIZATIONS',
                        style: GoogleFonts.notoSans(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  ]),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          child: Text('BLOGS',
                              style: GoogleFonts.notoSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))),
                      PopupMenuItem(
                          child: Text('EVENTS',
                              style: GoogleFonts.notoSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))),
                    ];
                  }),
              const SizedBox(width: 20),
              TextButton(
                  onPressed: () {},
                  child: Text('ABOUT',
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              const SizedBox(width: 20),
              TextButton(
                  onPressed: () {},
                  child: Text('CONTACT',
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
            ],
          ),
        )
      ],
    );
  }
}
