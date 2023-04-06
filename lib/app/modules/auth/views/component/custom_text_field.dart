import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../app_color.dart';

class CustomTextField extends StatelessWidget {

  final name;
  final IconData icon;
  final bool obscure;

  const CustomTextField({
    super.key,
    required this.name,
    required this.icon,
    this.obscure = false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: FormBuilderTextField(
          name: name,
          cursorColor: Colors.black,
          obscureText: obscure,
          decoration: InputDecoration(
            labelText: name,
            labelStyle: GoogleFonts.ibmPlexMono(fontWeight: FontWeight.w400),
            focusColor: AppColor.orange,
            floatingLabelStyle: GoogleFonts.ibmPlexMono(color: AppColor.orange,fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            prefixIcon: Icon(icon, color: Colors.black,),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(width: 1, color: AppColor.orange)
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(width: 1, color: Colors.black)
            ),
          )),
    );
  }
}
