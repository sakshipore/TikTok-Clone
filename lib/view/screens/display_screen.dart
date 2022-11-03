import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/controller/video_controller.dart';
import 'package:tik_tok_clone/view/widgets/album_rotator.dart';
import 'package:tik_tok_clone/view/widgets/profile_button.dart';
import 'package:tik_tok_clone/view/widgets/tik_tok_video_player.dart';

class DisplayVideoScreen extends StatelessWidget {
  DisplayVideoScreen({Key? key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            controller: PageController(
              initialPage: 0,
              viewportFraction: 1,
            ),
            itemCount: videoController.videoList.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  TikTokVideoPlayer(
                    videoUrl: videoController.videoList[index].videoUrl,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h, left: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          videoController.videoList[index].username,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          videoController.videoList[index].caption,
                        ),
                        Text(
                          videoController.videoList[index].songName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0.w,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 400,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3, right: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileButton(
                            profilePhotoUrl: videoController.videoList[index].profilePic,
                          ),
                          InkWell(
                            onTap: () {
                              videoController.likedVideo(videoController.videoList[index].id);
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 45.h,
                                  color: Colors.pinkAccent,
                                ),
                                Text(
                                  videoController.videoList[index].likes.length.toString(),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.reply,
                                size: 45.h,
                                color: Colors.white,
                              ),
                              Text(
                                videoController.videoList[index].shareCount.toString(),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.comment,
                                size: 45.h,
                                color: Colors.white,
                              ),
                              Text(
                                videoController.videoList[index].commentsCount.toString(),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              AlbumRotator(profilePicUrl: videoController.videoList[index].profilePic),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      ),
    );
  }
}
