import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Content2 extends StatelessWidget {
  const Content2({
    super.key,
    required this.width,
    required this.height
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: width,
      height: height,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("What's Happening?", style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 50, color: Color.fromRGBO(46, 54, 62, 1))),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){},
                      child: Card(
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
                                style: GoogleFonts.notoSans(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){},
                      child: Card(
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
                                Text('An offline, hands-on Blockchain based Developing session on developing Smart Contracts through Zilliqa Blockchain. More than 400 people registered for the event. Developers were taught how to develop Smart Contracts using SCILLA.',
                                style: GoogleFonts.notoSans(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){},
                      child: Card(
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
                                Text('OSSmosis',
                                style: GoogleFonts.ibmPlexMono(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                                ),
                                //detail
                                Text('A hackathon, where participants submitted their Open-Source Software Development projects. developing Smart Contracts through Zilliqa Blockchain. More than 400 people registered for the event. Developers were taught how to develop',
                                style: GoogleFonts.notoSans(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}