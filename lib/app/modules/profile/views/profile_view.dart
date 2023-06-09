// ignore_for_file: depend_on_referenced_packages, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/nav_bar.dart';
import 'package:pog/app/modules/component/white_container.dart';

import '../../../../data/app_color.dart';
import '../../../../data/persons.dart';
import '../../../../data/variable.dart';
import '../../auth/controllers/auth_controller.dart';
import '../controllers/profile_controller.dart';
import 'package:intl/intl.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.fetchUser(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: Lottie.network(
                      'https://assets5.lottiefiles.com/private_files/lf30_esg1l8r1.json'))
              : Scaffold(
                  extendBodyBehindAppBar: true,
                  backgroundColor: AppColor.grey,
                  appBar: AppBar(
                    title: NavBar(),
                    flexibleSpace: FlexibleSpaceBar(
                      background:
                          Image.network(Gvar.card_bg_2, fit: BoxFit.cover),
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
                            const WhiteContainer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100.0, vertical: 50),
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(10, 10))
                                    ],
                                    border: Border.all(
                                        width: 5, color: Colors.black),
                                    image: DecorationImage(
                                        image: NetworkImage(Gvar.card_bg),
                                        fit: BoxFit.cover)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: FormBuilder(
                                      key: controller.formKey,
                                      child: Obx(() {
                                        if (controller.thisUser.isNotEmpty) {
                                          Person person =
                                              controller.thisUser.first;
                                          return Column(
                                            children: [
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      await controller
                                                          .selectFile();
                                                    },
                                                    child: Stack(
                                                      children: [
                                                        CircleAvatar(
                                                            backgroundColor:
                                                                AppColor.orange,
                                                            backgroundImage: person
                                                                    .image_url
                                                                    .isNotEmpty
                                                                ? NetworkImage(
                                                                    person
                                                                        .image_url)
                                                                : const NetworkImage(
                                                                    'https://firebasestorage.googleapis.com/v0/b/piorganizer.appspot.com/o/assets%2Fdummy_card.jpg?alt=media&token=f1f5986a-a3da-4b8f-a450-75e8533f62af&_gl=1*1wpnn9p*_ga*MTQ1NjYxNTMxMC4xNjY0MTI0ODU3*_ga_CW55HF8NVT*MTY4NjEyODUzOC4zNy4xLjE2ODYxMzIwMzUuMC4wLjA.'),
                                                            radius: 70,
                                                            child: controller
                                                                        .isLoading ==
                                                                    true
                                                                ? Lottie.network(
                                                                    'https://assets5.lottiefiles.com/private_files/lf30_esg1l8r1.json')
                                                                : null),
                                                        const Positioned(
                                                            bottom: 5,
                                                            right: 5,
                                                            child: Icon(Icons
                                                                .add_a_photo_outlined)),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Hello, Welcome',
                                                        style: GoogleFonts
                                                            .ibmPlexMono(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 30),
                                                      ),
                                                      Text(
                                                          '${person.firstname} ${person.lastname}',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 50,
                                              ),
                                              //email
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 240,
                                                    child: Text(
                                                      'Email',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: FormBuilderTextField(
                                                        readOnly: true,
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                          FormBuilderValidators
                                                              .email()
                                                        ]),
                                                        name: 'email',
                                                        initialValue:
                                                            person.email,
                                                        cursorColor:
                                                            Colors.black,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'email',
                                                          labelStyle: GoogleFonts
                                                              .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                          focusColor:
                                                              AppColor.orange,
                                                          floatingLabelStyle:
                                                              GoogleFonts.montserrat(
                                                                  color: AppColor
                                                                      .orange,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      50),
                                                          prefixIcon:
                                                              const Icon(
                                                            Icons
                                                                .email_outlined,
                                                            color: Colors.black,
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  width: 1,
                                                                  color: AppColor
                                                                      .orange)),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .black)),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              //address
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 240,
                                                    child: Text(
                                                      'Address',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: FormBuilderTextField(
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                        ]),
                                                        name: 'address',
                                                        initialValue:
                                                            person.address,
                                                        cursorColor:
                                                            Colors.black,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'address',
                                                          labelStyle: GoogleFonts
                                                              .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                          focusColor:
                                                              AppColor.orange,
                                                          floatingLabelStyle:
                                                              GoogleFonts.montserrat(
                                                                  color: AppColor
                                                                      .orange,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      50),
                                                          prefixIcon:
                                                              const Icon(
                                                            Icons
                                                                .pin_drop_outlined,
                                                            color: Colors.black,
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  width: 1,
                                                                  color: AppColor
                                                                      .orange)),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .black)),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              //phone
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 240,
                                                    child: Text(
                                                      'Phone',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: FormBuilderTextField(
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                        ]),
                                                        name: 'phone',
                                                        initialValue:
                                                            person.phone_number,
                                                        cursorColor:
                                                            Colors.black,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'phone',
                                                          labelStyle: GoogleFonts
                                                              .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                          focusColor:
                                                              AppColor.orange,
                                                          floatingLabelStyle:
                                                              GoogleFonts.montserrat(
                                                                  color: AppColor
                                                                      .orange,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      50),
                                                          prefixIcon:
                                                              const Icon(
                                                            Icons
                                                                .phone_outlined,
                                                            color: Colors.black,
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  width: 1,
                                                                  color: AppColor
                                                                      .orange)),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .black)),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              //birth_date
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 240,
                                                    child: Text(
                                                      'Birth Date',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child:
                                                        FormBuilderDateTimePicker(
                                                      initialValue: DateFormat(
                                                              'yyyy-MM-dd')
                                                          .parse(person
                                                              .birth_date),
                                                      name: 'birth_date',
                                                      inputType: InputType.date,
                                                      validator:
                                                          FormBuilderValidators
                                                              .required(),
                                                      format: DateFormat(
                                                          'yyyy-MM-dd'),
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'birth date',
                                                        labelStyle: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                        focusColor:
                                                            AppColor.orange,
                                                        floatingLabelStyle:
                                                            GoogleFonts.montserrat(
                                                                color: AppColor
                                                                    .orange,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 50),
                                                        prefixIcon: const Icon(
                                                          Icons
                                                              .date_range_outlined,
                                                          color: Colors.black,
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: AppColor
                                                                    .orange)),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                const BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .black)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              //sex
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 240,
                                                    child: Text(
                                                      'Sex',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  SizedBox(
                                                    width: 250,
                                                    child:
                                                        FormBuilderRadioGroup(
                                                      validator:
                                                          FormBuilderValidators
                                                              .compose([
                                                        FormBuilderValidators
                                                            .required(),
                                                      ]),
                                                      name: 'sex',
                                                      initialValue: person.sex,
                                                      decoration:
                                                          const InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                      wrapAlignment:
                                                          WrapAlignment
                                                              .spaceBetween,
                                                      activeColor:
                                                          AppColor.orange,
                                                      options: [
                                                        FormBuilderFieldOption(
                                                            value: 'Male',
                                                            child: Text(
                                                              'Male',
                                                              style: GoogleFonts.ibmPlexMono(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                        FormBuilderFieldOption(
                                                            value: 'Female',
                                                            child: Text(
                                                                'Female',
                                                                style: GoogleFonts.ibmPlexMono(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .black))),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(
                                                height: 50,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    controller
                                                        .formKey.currentState!
                                                        .saveAndValidate();
                                                    controller.updateUser();
                                                  },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                          backgroundColor:
                                                              Colors.black,
                                                          fixedSize: const Size(
                                                              180, 50),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          )),
                                                  child: Text('SAVE CHANGES',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 15))),

                                              const SizedBox(height: 100),

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        AuthController.instance
                                                            .logout();
                                                        Get.offAllNamed(
                                                            '/landing');
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .redAccent,
                                                              fixedSize:
                                                                  const Size(
                                                                      100, 30),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40),
                                                              )),
                                                      child: Text(
                                                          'LOG OUT',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      10))),
                                                ],
                                              ),
                                            ],
                                          );
                                        } else {
                                          return const Center(
                                            child: Text('No Data'),
                                          );
                                        }
                                      })),
                                ),
                              ),
                            ),
                            const Footer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
