import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Icon(Icons.ac_unit_rounded, color:  Colors.black, size: 60)),

        Expanded(
          child: Row(
            children: [
              TextButton(onPressed: (){}, child: Text('About Us', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))),
              SizedBox(width: 20),
              TextButton(onPressed: (){}, child: Text('Events', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20))),
              SizedBox(width: 20),
              TextButton(onPressed: (){}, child: Text('Author', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20))),
              SizedBox(width: 20),
              TextButton(onPressed: (){}, child: Text('Contact Us', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20))),
            ],
          ),
        )
      ],
    );
  }
}
