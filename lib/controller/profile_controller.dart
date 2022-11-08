import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<String> _uid="".obs;
  getUserData() async {
    List<String> thumbnails = [];
    var myVideos=await FirebaseFirestore.instance.collection("videos").where("uid", isEqualTo: _uid.value).get();
  }
}
