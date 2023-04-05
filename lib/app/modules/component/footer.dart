import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Column(
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
                ),
                //info 2
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Pi Organizer', style: GoogleFonts.montserrat(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white)),
                    Text('Organize your\nevents better', style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white)),
                  ],
                ),
                //info 3
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(onPressed: (){}, child: Text('About  ',
                        style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white)
                    )),
                    SizedBox(height: 20),
                    TextButton(onPressed: (){}, child: Text('Contact Us',
                        style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white)
                    )),
                    SizedBox(height: 20),
                    TextButton(onPressed: (){}, child: Text('FAQ    ',
                        style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white)
                    )),
                  ],
                ),
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
