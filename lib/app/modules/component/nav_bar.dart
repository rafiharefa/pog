import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/events_page/views/events_page_view.dart';
import 'package:pog/app/modules/home_page/views/home_page_view.dart';

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
              TextButton(
                key: UniqueKey(),
                  onPressed: (){
                Get.offNamed('/home-page');
              }, child: Text('HOME', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))),
              SizedBox(width: 20),
              PopupMenuButton(
                child: Text('ORGANIZATIONS', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
                  itemBuilder: (context){
                return
                [
                  PopupMenuItem(child: Text('BLOGS', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 15))),
                  PopupMenuItem(child: Text('EVENTS', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 15))),
                ];
              }),
              SizedBox(width: 20),
              TextButton(onPressed: (){}, child: Text('AUTHOR', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20))),
              SizedBox(width: 20),
              TextButton(onPressed: (){}, child: Text('ABOUT', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20))),
              SizedBox(width: 20),
              TextButton(onPressed: (){}, child: Text('CONTACT', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20))),
            ],
          ),
        )
      ],
    );
  }
}
