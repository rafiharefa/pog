// ignore_for_file: unnecessary_overrides, non_constant_identifier_names, unused_local_variable, avoid_print

import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:http/http.dart' as http;
import 'package:pog/app/modules/organization_page/controllers/organization_page_controller.dart';
import 'package:pog/app/modules/profile/controllers/profile_controller.dart';

import '../../../../data/events.dart';
import '../../../../data/variable.dart';
import '../../component/fast_snack.dart';

class EventsPageController extends GetxController {
  final OrganizationPageController _organizationPageController =
      Get.put(OrganizationPageController());

  ProfileController profileController = Get.put(ProfileController());

  RxBool isClicked = false.obs;

  //fetch unregistered events

  RxList unreg_events = [].obs;

  Future fetchUnRegisteredEvents() async {
    String user_id = profileController.thisUser.first.user_id;

    final response = await http
        .get(Uri.parse('${Gvar.url}/applications/unRegistered/$user_id'));

    unreg_events.value = jsonDecode(response.body);
  }

  Uint8List? selectedImageBytes;
  RxString selectedFile = ''.obs;
  RxString imageUrl = ''.obs;

  RxList events = [].obs;
  RxList<Event> thisEvent = <Event>[].obs;
  RxList totalEventString = [].obs;
  RxList totalEventRemovedString = [].obs;
  RxList<int> totalEventInt = <int>[].obs;
  RxInt lastEventId = 0.obs;

  Future fetchEvent() async {
    final response = await http.get(Uri.parse('${Gvar.url}/events'));

    events.value = jsonDecode(response.body);

    for (var json in events) {
      Event event = Event.fromJson(json);
      thisEvent.add(event);
    }

    if (events.isEmpty) {
      lastEventId.value = 0;
    } else {
      totalEventString.value =
          events.map((element) => element['event_id']).toList();
      for (var element in totalEventString) {
        totalEventRemovedString.add(element.replaceAll(RegExp(r'[^0-9]'), ''));
      }
      for (var element in totalEventRemovedString) {
        totalEventInt.add(int.tryParse(element) ?? 0);
      }
      lastEventId.value = totalEventInt
          .reduce((value, element) => value > element ? value : element);
    }
  }

  void createEvent(
    String event_name,
    String event_desc,
    String event_date,
  ) async {
    await fetchEvent();

    final String event_id = "EVT${lastEventId + 1}";

    final String organization_id =
        _organizationPageController.thisOrganization.first.organization_id;

    if (imageUrl.value == '') {
      imageUrl.value =
          'https://firebasestorage.googleapis.com/v0/b/piorganizer.appspot.com/o/assets%2Fdummy_card.jpg?alt=media&token=f1f5986a-a3da-4b8f-a450-75e8533f62af&_gl=1*1wpnn9p*_ga*MTQ1NjYxNTMxMC4xNjY0MTI0ODU3*_ga_CW55HF8NVT*MTY4NjEyODUzOC4zNy4xLjE2ODYxMzIwMzUuMC4wLjA.';
    }

    final response =
        await http.post(Uri.parse('${Gvar.url}/events/createEvent'),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({
              'event_id': event_id,
              'event_name': event_name,
              'event_desc': event_desc,
              'event_date': event_date,
              'committee_amount': '0',
              'participant_amount': '0',
              'image_url': imageUrl.value,
              'organization_id': organization_id
            }));

    FastSnack('EVENT CREATED');
  }

  RxBool isLoading = false.obs;

  selectFile() async {
    FilePickerResult? fileResult = await FilePicker.platform.pickFiles();

    if (fileResult != null) selectedFile.value = fileResult.files.first.name;

    selectedImageBytes = fileResult!.files.first.bytes;

    uploadFile();
  }

  Future uploadFile() async {
    try {
      firebase_storage.UploadTask uploadTask;

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('events')
          .child('/${selectedFile.value}');

      final metadata =
          firebase_storage.SettableMetadata(contentType: 'image/jpeg');

      uploadTask = ref.putData(selectedImageBytes!, metadata);
      isLoading.value = true;
      await uploadTask.whenComplete(() => isLoading.value = false);
      imageUrl.value = await ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
