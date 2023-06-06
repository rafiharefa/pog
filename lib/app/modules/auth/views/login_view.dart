// ignore_for_file: prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/auth/controllers/auth_controller.dart';
import 'package:pog/app/modules/component/white_container.dart';

import '../../../../data/app_color.dart';
import '../../../../data/variable.dart';
import '../../component/footer.dart';

class LoginView extends GetView<AuthController> {
  final width;
  final height;

  const LoginView({Key? key, required this.width, required this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Gvar.bg), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black, offset: Offset(8, 8))
                      ],
                      border: Border.all(width: 3, color: Colors.black),
                      image: DecorationImage(
                          image: NetworkImage(Gvar.card_bg_2),
                          fit: BoxFit.cover)),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('SIGN IN',
                            style: GoogleFonts.ibmPlexMono(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                        SizedBox(
                          width: 350,
                          height: 70,
                          child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.email()
                              ]),
                              name: 'email',
                              cursorColor: Colors.black,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'email',
                                labelStyle: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w400),
                                focusColor: AppColor.orange,
                                floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                    color: AppColor.orange,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColor.orange)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.black)),
                              )),
                        ),
                        SizedBox(
                          width: 350,
                          height: 70,
                          child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(6,
                                    errorText:
                                        'Password must be greater than 6'),
                              ]),
                              name: 'password',
                              cursorColor: Colors.black,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'password',
                                labelStyle: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w400),
                                focusColor: AppColor.orange,
                                floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                    color: AppColor.orange,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                        width: 1, color: AppColor.orange)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.black)),
                              )),
                        ),
                        Obx(() => controller.loginError.value == 'true'
                            ? const Text(
                                'Wrong Email or Password!',
                                style: TextStyle(color: Colors.black),
                              )
                            : const SizedBox()),
                        ElevatedButton(
                            onPressed: () {
                              _formKey.currentState!.saveAndValidate();
                              AuthController.instance.login(
                                  _formKey.currentState!.value['email'],
                                  _formKey.currentState!.value['password']);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.orange,
                                fixedSize: const Size(350, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: Text('SIGN IN',
                                style: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 157,
                              height: 1,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 5),
                            Text('OR',
                                style: GoogleFonts.ibmPlexMono(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20)),
                            const SizedBox(width: 5),
                            Container(
                              width: 157,
                              height: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              controller.signInWithGoogle();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: const Size(350, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            icon: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/piorganizer.appspot.com/o/assets%2Fsearch.png?alt=media&token=29c33a63-3b7a-45b8-b013-34e3e5091448&_gl=1*1c7dywe*_ga*MTQ1NjYxNTMxMC4xNjY0MTI0ODU3*_ga_CW55HF8NVT*MTY4NjA4MDg2NC4zNS4xLjE2ODYwODYyNjUuMC4wLjA.',
                                width: 20),
                            label: Text(' GOOGLE SIGN IN',
                                style: GoogleFonts.ibmPlexMono(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                            TextButton(
                              onPressed: () {
                                controller.toggleScreen();
                              },
                              child: Text('SIGN UP',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
