// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

SnackbarController FastSnack(String message) {
  return Get.snackbar('', '',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: GoogleFonts.bebasNeue(color: Colors.black, fontSize: 50),
      ));
}
