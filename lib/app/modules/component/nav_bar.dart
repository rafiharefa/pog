import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/organization_page/views/my_organizations_view.dart';

import '../organization_page/views/author.dart';

class NavBar extends StatelessWidget {
  const NavBar({
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
                    Get.offAllNamed('/home-page');
                  },
                  child: Text('HOME',
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              const SizedBox(width: 20),
              TextButton(
                  onPressed: () {
                    Get.off(const MyOrganizationsView());
                  },
                  child: Text('ORGANIZATIONS',
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              const SizedBox(width: 20),
              TextButton(
                  onPressed: () {
                    Get.to(const AuthorView());
                  },
                  child: Text('AUTHOR',
                      style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
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
              const SizedBox(width: 20),
              TextButton(
                  onPressed: () {
                    Get.offAllNamed('/profile');
                  },
                  child: Text('PROFILE',
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
