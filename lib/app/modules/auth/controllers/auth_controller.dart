import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  var whatScreen = false.obs;

  void toggleScreen(){
    whatScreen.value = !whatScreen.value;
  }

  List<String> textfield = ['username', 'email', 'password'];

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
