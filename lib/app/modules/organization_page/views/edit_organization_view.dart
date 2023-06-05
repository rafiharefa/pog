// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/organization_page/views/component/org_navbar.dart';
import 'package:pog/app_color.dart';
import 'package:pog/data/organizations.dart';

import '../controllers/organization_page_controller.dart';

class EditOrganization extends GetView {
  const EditOrganization({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OrganizationPageController controller =
        Get.put(OrganizationPageController());

    GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      backgroundColor: AppColor.grey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const OrgNavBar(),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const WhiteContainer(),
            Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 70),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black, offset: Offset(10, 10))
                  ],
                  border: Border.all(width: 5, color: Colors.black),
                ),
                child: Obx(() {
                  Organization organization = controller.thisOrganization.first;
                  return FormBuilder(
                    key: formKey,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            const SizedBox(
                              height: 350,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: Image.network(
                                'https://images.unsplash.com/photo-1574169208507-84376144848b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=579&q=80',
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            Positioned(
                              top: 100,
                              child: InkWell(
                                onTap: () async {
                                  controller.selectFile();
                                },
                                child: CircleAvatar(
                                  backgroundImage: organization
                                          .image_url.isNotEmpty
                                      ? NetworkImage(organization.image_url)
                                      : const NetworkImage(
                                          'https://img.freepik.com/free-icon/user_318-804790.jpg'),
                                  radius: 100,
                                  child: controller.isLoading == true
                                      ? const CircularProgressIndicator()
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: FormBuilderTextField(
                              cursorColor: AppColor.orange,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.orange)),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.orange))),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()]),
                              name: 'name',
                              initialValue: organization.organization_name,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: FormBuilderTextField(
                              maxLines: 5,
                              cursorColor: AppColor.orange,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.orange)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.orange))),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()]),
                              name: 'desc',
                              initialValue: organization.organization_desc,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                        ),

                        //PLACE EVENTS HERE!!!

                        const SizedBox(height: 30),
                        Text('ADDRESS',
                            style: GoogleFonts.bebasNeue(
                              color: Colors.black,
                              fontSize: 50,
                            )),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: FormBuilderTextField(
                              cursorColor: AppColor.orange,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.orange)),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.orange))),
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()]),
                              name: 'address',
                              initialValue: organization.organization_address,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                        Text('CONTACT US',
                            style: GoogleFonts.bebasNeue(
                              color: Colors.black,
                              fontSize: 50,
                            )),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: FormBuilderTextField(
                                textAlign: TextAlign.center,
                                cursorColor: AppColor.orange,
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: AppColor.orange)),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColor.orange))),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.email(),
                                ]),
                                name: 'email',
                                initialValue: organization.email,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: FormBuilderTextField(
                                textAlign: TextAlign.center,
                                cursorColor: AppColor.orange,
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: AppColor.orange)),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColor.orange))),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                ]),
                                name: 'phone',
                                initialValue: organization.phone_number,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              formKey.currentState!.saveAndValidate();

                              if (formKey.currentState!.isValid) {
                                await controller.updateOrganization(
                                    formKey.currentState!.value['name'],
                                    formKey.currentState!.value['desc'],
                                    formKey.currentState!.value['address'],
                                    formKey.currentState!.value['email'],
                                    formKey.currentState!.value['phone']);

                                controller.refreshPage();

                                Get.offNamed('/organization-page');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.orange,
                                fixedSize: const Size(180, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                            child: Text('SAVE CHANGES',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15))),

                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  );
                })),
            const Footer()
          ],
        ),
      ),
    );
  }
}
