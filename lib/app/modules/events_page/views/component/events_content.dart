// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../app_color.dart';

class EventsContent extends StatelessWidget {
  const EventsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Colors.white,
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          child: SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //gambar
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/dummy3.png', height: 260)),
                  const SizedBox(height: 10),
                  //title
                  Text('Women in Tech',
                    style: GoogleFonts.ibmPlexMono(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  //detail
                  Text('An online Speaker session presided by the leading Female Professionals in today’s World. We had Speakers from different parts of the world, doing ground-breaking work in different fields such as CyberSecurity, Aerospace, Ed-Tech, etc.',
                    style: GoogleFonts.notoSans(fontSize: 10, fontWeight: FontWeight.w400,color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColor.grey,
                              boxShadow: [
                                const BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                )
                              ]
                          ),
                          width: 120,
                          height: 30,
                          child: Center(
                            child: Text('Register', textAlign: TextAlign.center
                              ,style: GoogleFonts.montserrat(fontSize: 10,fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 40),
        Card(
          color: Colors.white,
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          child: SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //gambar
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/dummy1.png', height: 260)),
                  const SizedBox(height: 10),
                  //title
                  Text('UNHASHED: Demystifying the Blockchain', maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.ibmPlexMono(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  //detail
                  Text('An online Speaker session presided by the leading Female Professionals in today’s World. We had Speakers from different parts of the world, doing ground-breaking work in different fields such as CyberSecurity, Aerospace, Ed-Tech, etc.',
                    style: GoogleFonts.notoSans(fontSize: 10, fontWeight: FontWeight.w400,color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColor.grey,
                              boxShadow: [
                                const BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                )
                              ]
                          ),
                          width: 120,
                          height: 30,
                          child: Center(
                            child: Text('Register', textAlign: TextAlign.center
                              ,style: GoogleFonts.montserrat(fontSize: 10,fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
