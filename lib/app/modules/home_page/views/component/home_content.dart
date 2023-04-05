import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../app_color.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
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
          child: Container(
            width: 300,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //gambar
                  Icon(Icons.ac_unit_rounded, size: 200),
                  //title
                  Text('Women in Tech',
                    style: GoogleFonts.ibmPlexMono(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  //detail
                  Text('An online Speaker session presided by the leading Female Professionals in today’s World. We had Speakers from different parts of the world, doing ground-breaking work in different fields such as CyberSecurity, Aerospace, Ed-Tech, etc.',
                    style: GoogleFonts.notoSans(fontSize: 10, fontWeight: FontWeight.w400,color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: AppColor.orange,
                        width: 100,
                        height: 20,
                        child: Center(child: Text('REGISTERED', style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700),)),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColor.grey,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                )
                              ]
                          ),
                          width: 120,
                          height: 30,
                          child: Center(
                            child: Text('View More\nDetails', textAlign: TextAlign.center
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
        SizedBox(width: 40),
        Card(
          color: Colors.white,
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          child: Container(
            width: 300,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //gambar
                  Icon(Icons.ac_unit_rounded, size: 200),
                  //title
                  Text('UNHASHED: Demystifying the Blockchain',
                    style: GoogleFonts.ibmPlexMono(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  //detail
                  Text('An online Speaker session presided by the leading Female Professionals in today’s World. We had Speakers from different parts of the world, doing ground-breaking work in different fields such as CyberSecurity, Aerospace, Ed-Tech, etc.',
                    style: GoogleFonts.notoSans(fontSize: 10, fontWeight: FontWeight.w400,color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: AppColor.orange,
                        width: 100,
                        height: 20,
                        child: Center(child: Text('REGISTERED', style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700),)),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColor.grey,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                )
                              ]
                          ),
                          width: 120,
                          height: 30,
                          child: Center(
                            child: Text('View More\nDetails', textAlign: TextAlign.center
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
