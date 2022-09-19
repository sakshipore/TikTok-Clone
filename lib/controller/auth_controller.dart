import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tok_clone/model/user.dart';
import 'package:tik_tok_clone/view/screens/auth/login_screen.dart';
import 'package:tik_tok_clone/view/screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  File? profileImage;

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final img = File(image.path);
    this.profileImage = img;
  }

  // User State Persistence
  late Rx<User?> _user;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    // Observable keyword Rx - Continuously checking whether the value of variable is changing or not
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    // bindStream - see the changes happening while authentication
    ever(_user, _setInitialView);
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  // User Register
  void SignUp(
    String username,
    String email,
    String password,
    File? image,
  ) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadURL = await _uploadProfilePicture(image);

        myUser user = myUser(
            name: username,
            profilePhoto: downloadURL,
            email: email,
            uid: credential.user!.uid);

        // Upload data to firebase
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
            "Error Creating Accout", "Please enter all required fields");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  Future<String> _uploadProfilePicture(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwnUrl = await snapshot.ref.getDownloadURL();
    return imageDwnUrl;
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Error Logging In", "Please enter all the fields");
      }
    } catch (e) {
      Get.snackbar("Error Logging In", e.toString());
    }
  }
}
