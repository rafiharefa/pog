// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_overrides

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  RxList users = [].obs;

  Future fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://api.pog.otech.id/users'));
    users.value = jsonDecode(response.body);
  }

  void createUser(
      String lastname,
      String firstname,
      String email,
      String password,
      String address,
      String birth_date,
      String phone_number,
      String sex) async {
    String user_id = 'USR${users.length + 1}';
    String image_url = 'https://img.freepik.com/free-icon/user_318-804790.jpg';

    try {
      final response = await http.post(
          Uri.parse('https://api.pog.otech.id/users/createUser'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{
            'user_id': user_id,
            'lastname': lastname,
            'firstname': firstname,
            'email': email,
            'password': password,
            'address': address,
            'birth_date': birth_date,
            'phone_number': phone_number,
            'sex': sex,
            'image_url': image_url
          }));

      if (response.statusCode == 200) {
        fetchUsers();
      }
    } catch (e) {
      print('error: $e');
    }
  }

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  var whatScreen = false.obs;

  void toggleScreen() {
    whatScreen.value = !whatScreen.value;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/landing');
    } else {
      Get.offAllNamed('home-page');
    }
  }

  RxString registerError = 'false'.obs;

  final formKey = GlobalKey<FormBuilderState>();

  void register(String email, String password) async {
    try {
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      if (signInMethods.contains('password')) {
        print('Email sudah terdaftar');
        // Tindakan yang sesuai jika email sudah terdaftar
        registerError.value = 'true';
      } else {
        print('Email belum terdaftar');
        // Tindakan yang sesuai jika email belum terdaftar

        await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        createUser(
            formKey.currentState!.value['lastname'],
            formKey.currentState!.value['firstname'],
            formKey.currentState!.value['email'],
            formKey.currentState!.value['password'],
            formKey.currentState!.value['address'],
            formKey.currentState!.value['birth_date'].toString(),
            formKey.currentState!.value['phone'],
            formKey.currentState!.value['sex']);
      }
    } catch (e) {
      print('Terjadi kesalahan: ${e.toString()}');
      // Tindakan yang sesuai untuk kesalahan
    }
  }

  RxString loginError = 'false'.obs;

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          loginError.value = 'true';
          // Tindakan yang sesuai jika email tidak terdaftar
        } else if (e.code == 'wrong-password') {
          print('Password salah');
          loginError.value = 'true';
          // Tindakan yang sesuai jika password salah
        } else {
          print('Terjadi kesalahan: ${e.message}');
          loginError.value = 'true';
          // Tindakan yang sesuai untuk kesalahan lainnya
        }
      }
    }
  }

  void logout() async {
    await auth.signOut();
    signOut();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUsers();
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
