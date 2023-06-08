import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'footer_content_1.dart';
import 'footer_content_2.dart';
import 'footer_content_3.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  //info 1
                  Expanded(flex: 2, child: FooterContent1()),
                  //info 2
                  Expanded(child: FooterContent2()),
                  //info 3
                  Expanded(flex: 2, child: FooterContent3()),
                ],
              ),
              const SizedBox(height: 20),
              Text('created by group 6 Software Engineering 4A',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400))
            ],
          ),
        ),
      ),
    );
  }
}
