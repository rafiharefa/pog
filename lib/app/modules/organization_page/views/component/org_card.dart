// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  final image;
  final title;
  final detail;
  const EventCard(
      {super.key,
      required this.image,
      required this.title,
      required this.detail});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: 350,
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //gambar
              Container(
                height: 300,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),

              //title
              Text(
                title,
                style: GoogleFonts.ibmPlexMono(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              //detail
              Text(
                detail,
                style: GoogleFonts.notoSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
