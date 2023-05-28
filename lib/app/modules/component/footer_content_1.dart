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
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(Icons.ac_unit_rounded, color: Colors.white, size: 44),
          const SizedBox(width: 5),
          Text('POG',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: Colors.white)),
        ]),
        const SizedBox(height: 10),
        //Detail
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('RPL UPI',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 10)),
            Text(
                'Jl. Pendidikan No.15, Cibiru Wetan,\nKec. Cileunyi, Kabupaten Bandung,\nJawa Barat 40625',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 10))
          ],
        ),
        const SizedBox(height: 10),
        //sosmed
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.ac_unit_rounded, size: 18, color: Colors.white),
              onPressed: () {},
            ),
            const Icon(Icons.ac_unit_rounded, size: 18, color: Colors.white),
          ],
        ),
      ],
    );
  }
}
