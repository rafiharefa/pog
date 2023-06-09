import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pog/app/modules/organization_page/controllers/organization_page_controller.dart';
import 'package:pog/app/modules/organization_page/views/author.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/data/app_color.dart';

import '../../../../data/variable.dart';

class CreateOrganizationView extends GetView<OrganizationPageController> {
  const CreateOrganizationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OrganizationPageController controller =
        Get.put(OrganizationPageController());

    controller.fetchOrganization();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(Gvar.card_bg_2, fit: BoxFit.cover),
        ),
        elevation: 0,
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
                Container(
                  height: 100,
                ),
                Container(
                  width: 600,
                  height: 800,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.black, offset: Offset(8, 8))
                      ],
                      border: Border.all(width: 3, color: Colors.black),
                      image: DecorationImage(
                          image: NetworkImage(Gvar.card_bg_2),
                          fit: BoxFit.cover)),
                  child: FormBuilder(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 25),

                        Text('SET UP ORGANIZATION',
                            style: GoogleFonts.ibmPlexMono(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),

                        const SizedBox(height: 25),

                        //name
                        SizedBox(
                          width: 550,
                          height: 70,
                          child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.maxLength(50),
                              ]),
                              name: 'name',
                              cursorColor: Colors.black,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Organization Name',
                                labelStyle: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w400),
                                focusColor: AppColor.orange,
                                floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                    color: AppColor.orange,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                prefixIcon: const Icon(
                                  Icons.abc_outlined,
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

                        //desc
                        SizedBox(
                          width: 550,
                          height: 70,
                          child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.maxLength(500),
                              ]),
                              name: 'desc',
                              cursorColor: Colors.black,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Organization Description',
                                labelStyle: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w400),
                                focusColor: AppColor.orange,
                                floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                    color: AppColor.orange,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                prefixIcon: const Icon(
                                  Icons.align_horizontal_left_outlined,
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
                                labelText: 'Organization Email',
                                labelStyle: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w400),
                                focusColor: AppColor.orange,
                                floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                    color: AppColor.orange,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
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

                        //key
                        SizedBox(
                          width: 550,
                          height: 70,
                          child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(6,
                                    errorText: 'Key must be greater than 6'),
                                FormBuilderValidators.maxLength(50),
                              ]),
                              name: 'key',
                              cursorColor: Colors.black,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Organization Key',
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
                                labelText: 'Organization Address',
                                labelStyle: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w400),
                                focusColor: AppColor.orange,
                                floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                    color: AppColor.orange,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                prefixIcon: const Icon(
                                  Icons.pin_drop_outlined,
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

                        //phone
                        SizedBox(
                          width: 550,
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
                                labelText: 'Organization Phone',
                                labelStyle: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w400),
                                focusColor: AppColor.orange,
                                floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                    color: AppColor.orange,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                prefixIcon: const Icon(
                                  Icons.phone,
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

                        ElevatedButton(
                            onPressed: () async {
                              controller.formKey.currentState!.validate();
                              if (controller.formKey.currentState!.isValid) {
                                controller.formKey.currentState!.save();
                                controller.createOrganization();
                              } else {
                                controller.thisOrganization.clear();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.orange,
                                fixedSize: const Size(350, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: Text('CREATE',
                                style: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Enter Existing Organization?",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                            TextButton(
                              onPressed: () {
                                Get.off(const AuthorView());
                              },
                              child: Text('CLICK HERE',
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
