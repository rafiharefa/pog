// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingCard extends StatelessWidget {

  final image;
  final title;
  final detail;
  const LandingCard({
    super.key,
    required this.image, required this.title, required this.detail
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (){},
        child: Card(
          color: Colors.white,
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          child: SizedBox(
            width: 350,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //gambar
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(image, height: 300)),

                  //title
                  Text(title,
                    style: GoogleFonts.ibmPlexMono(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  //detail
                  Text(detail,
                    style: GoogleFonts.notoSans(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}