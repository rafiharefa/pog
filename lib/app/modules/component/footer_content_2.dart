import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterContent2 extends StatelessWidget {
  const FooterContent2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Pi Organizer', style: GoogleFonts.montserrat(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white)),
        const SizedBox(height: 10),
        Text('Organize your events', style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white)),
        Text('Better', style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white)),
      ],
    );
  }
}
