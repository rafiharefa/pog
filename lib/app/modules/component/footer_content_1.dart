import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/data/variable.dart';

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
          Image.network(
            Gvar.logo1,
            width: 30,
          ),
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
            Image.network(
              Gvar.logo1,
              width: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.network(
              Gvar.logo1,
              width: 15,
            ),
          ],
        ),
      ],
    );
  }
}
