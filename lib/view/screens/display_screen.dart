import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tik_tok_clone/view/widgets/album_rotator.dart';
import 'package:tik_tok_clone/view/widgets/profile_button.dart';
import 'package:tik_tok_clone/view/widgets/tik_tok_video_player.dart';

class DisplayVideoScreen extends StatelessWidget {
  const DisplayVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(
          initialPage: 0,
          viewportFraction: 1,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              TikTokVideoPlayer(
                videoUrl: "aaa",
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.h, left: 15.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "@Username",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      "MY CAPTION IS HERE",
                    ),
                    Text(
                      "SONG NAME",
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
                  height: MediaQuery.of(context).size.height-400,               
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileButton(
                        profilePhotoUrl: "ABC",
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 45.h,
                            color: Colors.white,
                          ),
                          Text(
                            "Like",
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
                            Icons.reply,
                            size: 45.h,
                            color: Colors.white,
                          ),
                          Text(
                            "Share",
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
                            "Comments",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          AlbumRotator(profilePicUrl: "ABC"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
