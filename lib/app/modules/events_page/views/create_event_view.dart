// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pog/app/modules/component/footer.dart';
import 'package:pog/app/modules/component/white_container.dart';
import 'package:pog/app/modules/events_page/controllers/events_page_controller.dart';
import 'package:pog/app/modules/organization_page/controllers/organization_page_controller.dart';
import 'package:pog/app/modules/organization_page/views/component/org_navbar.dart';
import 'package:pog/data/app_color.dart';
import 'package:intl/intl.dart';

import '../../../../data/variable.dart';

class CreateEventView extends GetView {
  const CreateEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    EventsPageController controller = Get.put(EventsPageController());

    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColor.grey,
        appBar: AppBar(
          title: const OrgNavBar(),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Gvar.bg), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const WhiteContainer(),
                Container(
                  width: 600,
                  height: 800,
                  margin: const EdgeInsets.symmetric(vertical: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.black, offset: Offset(8, 8))
                      ],
                      border: Border.all(width: 3, color: Colors.black),
                      image: DecorationImage(
                          image: NetworkImage(Gvar.card_bg),
                          fit: BoxFit.cover)),
                  child: FormBuilder(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),

                        Text('SET UP EVENT',
                            style: GoogleFonts.ibmPlexMono(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(
                          height: 30,
                        ),

                        //image
                        MouseRegion(
                          cursor: MaterialStateMouseCursor.clickable,
                          child: GestureDetector(
                            onTap: () {
                              controller.selectFile();
                            },
                            child: Container(
                                width: 200,
                                height: 250,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.black),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(4, 4),
                                          color: Colors.black)
                                    ]),
                                child: Obx(() => controller
                                        .selectedFile.value.isEmpty
                                    ? const Center(
                                        child: Icon(Icons.add_a_photo_outlined),
                                      )
                                    : Image.memory(
                                        controller.selectedImageBytes!,
                                        fit: BoxFit.cover,
                                      ))),
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),

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
                                labelText: 'Event Name',
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
                                labelText: 'Event Description',
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
                        //date

                        SizedBox(
                          width: 550,
                          height: 70,
                          child: FormBuilderDateTimePicker(
                              name: 'event_date',
                              inputType: InputType.date,
                              validator: FormBuilderValidators.required(),
                              format: DateFormat('yyyy-MM-dd'),
                              decoration: InputDecoration(
                                labelText: 'Event Date',
                                labelStyle: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w400),
                                focusColor: AppColor.orange,
                                floatingLabelStyle: GoogleFonts.ibmPlexMono(
                                    color: AppColor.orange,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                prefixIcon: const Icon(
                                  Icons.date_range_outlined,
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
                              OrganizationPageController
                                  organizationPageController =
                                  Get.put(OrganizationPageController());

                              formKey.currentState!.validate();
                              if (formKey.currentState!.isValid) {
                                formKey.currentState!.save();
                                final FK = formKey.currentState!.value;
                                controller.createEvent(FK['name'], FK['desc'],
                                    FK['event_date'].toString());
                                await organizationPageController
                                    .fetchOrganization();
                                await organizationPageController
                                    .selectOrganization(
                                        organizationPageController
                                            .thisOrganization
                                            .first
                                            .organization_id);
                                await organizationPageController
                                    .fetchOrganizationEvents();
                                await Get.offNamed('/organization-page');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                fixedSize: const Size(350, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                            child: Text('CREATE',
                                style: GoogleFonts.ibmPlexMono(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20))),

                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
        ));
  }
}
