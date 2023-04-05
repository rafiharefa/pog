import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterContent1 extends StatelessWidget {
  const FooterContent1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //POG
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.ac_unit_rounded, color: Colors.white, size: 44),
              SizedBox(width: 5),
              Text('POG', style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 40, color: Colors.white)),
            ]),
        SizedBox(height: 10),
        //Detail
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('RPL UPI',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, color: Colors.white,fontSize: 10)),
            Text('Jl. Pendidikan No.15, Cibiru Wetan,\nKec. Cileunyi, Kabupaten Bandung,\nJawa Barat 40625',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, color: Colors.white,fontSize: 10))
          ],
        ),
        SizedBox(height: 10),
        //sosmed
        Row(
          children: [
            Icon(Icons.ac_unit_rounded, size: 18, color: Colors.white),
            Icon(Icons.ac_unit_rounded, size: 18, color: Colors.white),
          ],
        ),
      ],
    );
  }
}
