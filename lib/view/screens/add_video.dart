import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tok_clone/constants.dart';
import 'package:tik_tok_clone/view/screens/add_caption_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => AddCaptionScreen(
                  videoFile: File(video.path), videoPath: video.path,)),),);
    } else {
      Get.snackbar(
          "Error in selecting video", "Please choose a different file");
    }
  }

  showDialogOpt(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () {
              pickVideo(ImageSource.gallery, context);
            },
            child: Text(
              "Gallery",
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              pickVideo(ImageSource.camera, context);
            },
            child: Text(
              "Camera",
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Close",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showDialogOpt(context);
          },
          child: Container(
            height: 50.h,
            width: 190.w,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Center(
              child: Text(
                "Add Video",
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
