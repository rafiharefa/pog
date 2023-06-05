// ignore_for_file: unnecessary_overrides

import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:http/http.dart' as http;
import 'package:pog/app/modules/organization_page/controllers/organization_page_controller.dart';

import '../../../../data/events.dart';
import '../../component/fast_snack.dart';

class EventsPageController extends GetxController {
  OrganizationPageController _organizationPageController =
      Get.put(OrganizationPageController());

  Uint8List? selectedImageBytes;
  RxString selectedFile = ''.obs;
  RxString imageUrl = ''.obs;

  RxList events = [].obs;
  RxList<Event> thisEvent = <Event>[].obs;

  Future fetchEvent() async {
    final response = await http.get(Uri.parse('http://localhost:8000/events'));

    events.value = jsonDecode(response.body);

    for (var json in events) {
      Event event = Event.fromJson(json);
      thisEvent.add(event);
    }
  }

  void createEvent(
    String event_name,
    String event_desc,
    String event_date,
  ) async {
    await fetchEvent();

    final String event_id = "EVT${events.length + 1}";

    final String organization_id =
        _organizationPageController.thisOrganization.first.organization_id;

    if (imageUrl.value == '') {
      imageUrl.value =
          'https://wp-mktg.prod.getty1.net/istockcontentredesign/wp-content/uploads/sites/5/2020/06/2021_whatarevectorgraphics_hero.jpg';
    }

    final response =
        await http.post(Uri.parse('http://localhost:8000/events/createEvent'),
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
