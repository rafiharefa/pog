import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:quiver/strings.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/auth/controllers/auth_controller.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app_color.dart';

class RegisterView extends GetView<AuthController> {
  final width;
  final height;
  const RegisterView({Key? key, required this.width, required this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WhiteContainer(),
              Container(
                width: 600,
                height: 800,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black, offset: Offset(8, 8))
                  ],
                  border: Border.all(width: 3, color: Colors.black),
                ),
                child: FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 25),

                      Text('SET UP ACCOUNT',
                          style: GoogleFonts.ibmPlexMono(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),

                      SizedBox(height: 25),

                      Container(
                        width: 550,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //firstname
                            SizedBox(
                              width: 250,
                              height: 70,
                              child: FormBuilderTextField(
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.maxLength(50),
                                  ]),
                                  name: 'firstname',
                                  cursorColor: Colors.black,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    labelText: 'first name',
                                    labelStyle: GoogleFonts.ibmPlexMono(
                                        fontWeight: FontWeight.w400),
                                    focusColor: AppColor.orange,
                                    floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                        color: AppColor.orange,
                                        fontWeight: FontWeight.w400),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                      color: Colors.black,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColor.orange)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black)),
                                  )),
                            ),

                            //lastname
                            SizedBox(
                              width: 230,
                              height: 70,
                              child: FormBuilderTextField(
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.maxLength(50),
                                  ]),
                                  name: 'lastname',
                                  cursorColor: Colors.black,
                                  textAlign: TextAlign.center,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'last name',
                                    labelStyle: GoogleFonts.ibmPlexMono(
                                        fontWeight: FontWeight.w400),
                                    focusColor: AppColor.orange,
                                    floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                        color: AppColor.orange,
                                        fontWeight: FontWeight.w400),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColor.orange)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black)),
                                  )),
                            ),
                          ],
                        ),
                      ),

                      //email
                      SizedBox(
                        width: 550,
                        height: 70,
                        child: FormBuilderTextField(
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                              FormBuilderValidators.maxLength(50),
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
                                  EdgeInsets.symmetric(horizontal: 50),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColor.orange)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                            )),
                      ),

                      //password
                      SizedBox(
                        width: 550,
                        height: 70,
                        child: FormBuilderTextField(
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6,
                                  errorText: 'Password must be greater than 6'),
                              FormBuilderValidators.maxLength(50),
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
                                  EdgeInsets.symmetric(horizontal: 50),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColor.orange)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                            )),
                      ),

                      //address
                      SizedBox(
                        width: 550,
                        height: 70,
                        child: FormBuilderTextField(
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.maxLength(50),
                            ]),
                            name: 'address',
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: 'address',
                              labelStyle: GoogleFonts.ibmPlexMono(
                                  fontWeight: FontWeight.w400),
                              focusColor: AppColor.orange,
                              floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                  color: AppColor.orange,
                                  fontWeight: FontWeight.w400),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 50),
                              prefixIcon: Icon(
                                Icons.pin_drop_outlined,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColor.orange)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                            )),
                      ),

                      Container(
                        width: 550,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //phone
                            SizedBox(
                              width: 250,
                              height: 70,
                              child: FormBuilderTextField(
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.numeric(),
                                    FormBuilderValidators.maxLength(13),
                                  ]),
                                  name: 'phone',
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    labelText: 'phone',
                                    labelStyle: GoogleFonts.ibmPlexMono(
                                        fontWeight: FontWeight.w400),
                                    focusColor: AppColor.orange,
                                    floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                        color: AppColor.orange,
                                        fontWeight: FontWeight.w400),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.black,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColor.orange)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black)),
                                  )),
                            ),

                            //sex
                            SizedBox(
                              width: 200,
                              height: 70,
                              child: FormBuilderRadioGroup(
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                name: 'sex',
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                wrapAlignment: WrapAlignment.spaceBetween,
                                activeColor: AppColor.orange,
                                options: [
                                  FormBuilderFieldOption(
                                      value: 'Male',
                                      child: Text(
                                        'Male',
                                        style: GoogleFonts.ibmPlexMono(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      )),
                                  FormBuilderFieldOption(
                                      value: 'Female',
                                      child: Text('Female',
                                          style: GoogleFonts.ibmPlexMono(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //birth date
                      SizedBox(
                        width: 550,
                        height: 70,
                        child: FormBuilderDateTimePicker(
                          name: 'birth_date',
                          inputType: InputType.date,
                          validator: FormBuilderValidators.required(),
                          format: DateFormat('yyyy-MM-dd'),
                          decoration: InputDecoration(
                            labelText: 'birth date',
                            labelStyle: GoogleFonts.ibmPlexMono(
                                fontWeight: FontWeight.w400),
                            focusColor: AppColor.orange,
                            floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                color: AppColor.orange,
                                fontWeight: FontWeight.w400),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 50),
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                              color: Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1, color: AppColor.orange)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
                          ),
                        ),
                      ),

                      Obx(() => controller.registerError.value == 'true'
                          ? Text(
                              'Email is already Exist!',
                              style: TextStyle(color: Colors.black),
                            )
                          : SizedBox()),

                      ElevatedButton(
                          onPressed: () {
                            controller.formKey.currentState!.saveAndValidate();

                            AuthController.instance.register(
                                controller.formKey.currentState!.value['email'],
                                controller
                                    .formKey.currentState!.value['password']);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.orange,
                              fixedSize: Size(350, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text('SIGN UP',
                              style: GoogleFonts.ibmPlexMono(
                                  fontWeight: FontWeight.w600, fontSize: 20))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 157,
                            height: 1,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text('OR',
                              style: GoogleFonts.ibmPlexMono(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20)),
                          SizedBox(width: 5),
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
                              fixedSize: Size(350, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          icon: Image.asset('assets/search.png', width: 20),
                          label: Text(' GOOGLE SIGN UP',
                              style: GoogleFonts.ibmPlexMono(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("I have an Account!",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                          TextButton(
                            onPressed: () {
                              controller.toggleScreen();
                            },
                            child: Text('SIGN IN',
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
              SizedBox(height: 100),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
