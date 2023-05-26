import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class AuthController extends GetxController {
  //TODO: Implement AuthController

  static AuthController instance = Get.find();

  RxList users = [].obs;

  Future fetchUsers() async{
    final response = await http.get(Uri.parse('http://localhost:8000/users'));
    users.value = jsonDecode(response.body);
  }
  
  void createUser(String lastname, String firstname,String email,String password,String address,String birth_date,String phone_number,String sex) async{

    String id_user = 'USR${users.length+1}';

    try{
      final response = await http.post(
        Uri.parse('http://localhost:8000/users/createUser'),
        headers:<String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },

        body: jsonEncode(<String, String>{'id_user': id_user, 'lastname': lastname, 'firstname' : firstname,
          'email': email, 'password':password, 'address':address, 'birth_date': birth_date, 'phone_number':phone_number, 'sex': sex})

    );

      if (response.statusCode == 200) {
        fetchUsers();
      }

    }catch(e){
      print('error: $e');
    }
  }
  
  

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  var whatScreen = false.obs;

  void toggleScreen(){
    whatScreen.value = !whatScreen.value;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });

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
