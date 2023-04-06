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
      children: [
        Expanded(child: IconButton(
          onPressed: (){
            Get.offAllNamed('/landing');
          },
            iconSize: 60,
           icon: Icon(Icons.ac_unit_rounded, color:  Colors.black,)
        )),

        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                key: UniqueKey(),
                  onPressed: (){
                Get.offAllNamed('/home-page');
              }, child: Text('HOME', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))),
              SizedBox(width: 20),
              PopupMenuButton(
                child: Row(
                  children: [
                    Text('ORGANIZATIONS', style: GoogleFonts.notoSans(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)),
                    Icon(Icons.arrow_drop_down, color: Colors.black,),
                  ]
                ),
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
