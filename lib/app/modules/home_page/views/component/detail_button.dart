import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailButton extends StatelessWidget {
  const DetailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(6, 6)
            ),
          ]
      ),
      width: 250,
      height: 60,
      child: Center(
        child: Text('Find Another Events', style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700, color: Colors.black, fontSize: 18,
        )),
      ),
    );
  }
}
