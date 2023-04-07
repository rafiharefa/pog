import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  var whatScreen = false.obs;

  void toggleScreen(){
    whatScreen.value = !whatScreen.value;
  }

  List<String? Function(String?)> validator = [FormBuilderValidators.required(),FormBuilderValidators.email()];

  List<String> textfield = ['username', 'email', 'password'];

  _initialScreen(User? user){
    if(user == null){
      Get.offAllNamed('login');
    }else{
      Get.offAllNamed('home-page');
    }
  }

  void register(String email, String password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
    }
  }
  void login(String email, String password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
    }
  }
  void logout() async{
    await auth.signOut();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
