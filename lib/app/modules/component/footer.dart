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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //info 1
                FooterContent1(),
                //info 2
                FooterContent2(),
                //info 3
                FooterContent3(),
              ],
            ),
            SizedBox(height: 20),
            Text('created by group 6 Software Engineering 4A',
                style: GoogleFonts.montserrat(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}



