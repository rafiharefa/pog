// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/data/variable.dart';

SnackbarController FastSnack(String message) {
  return Get.snackbar('', '',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      backgroundColor: Colors.white,
      messageText: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Gvar.card_bg_2), fit: BoxFit.cover)),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.bebasNeue(color: Colors.black, fontSize: 50),
        ),
      ));
}
