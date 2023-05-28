import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterContent3 extends StatelessWidget {
  const FooterContent3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextButton(onPressed: (){}, child: Text('About',
            style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white)
        )),
        const SizedBox(height: 20),
        TextButton(onPressed: (){}, child: Text('Contact Us',
            style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white)
        )),
        const SizedBox(height: 20),
        TextButton(onPressed: (){}, child: Text('FAQ',
            style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white)
        )),
      ],
    );
  }
}
