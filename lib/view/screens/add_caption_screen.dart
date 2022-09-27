import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tik_tok_clone/constants.dart';
import 'package:tik_tok_clone/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';

class AddCaptionScreen extends StatefulWidget {
  File videoFile;
  String videoPath;
  AddCaptionScreen({Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  late VideoPlayerController videoPlayerController;
  TextEditingController songNameController = new TextEditingController();
  TextEditingController captionController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width,
              child: VideoPlayer(videoPlayerController),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextInputField(
                    controller: songNameController,
                    myIcon: Icons.music_note,
                    myLabelText: "Song name",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextInputField(
                    controller: captionController,
                    myIcon: Icons.closed_caption,
                    myLabelText: "Caption",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Upload",
                    ),
                    style: ElevatedButton.styleFrom(primary: buttonColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
