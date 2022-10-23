import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({Key? key, required this.profilePhotoUrl}) : super(key: key);

  String profilePhotoUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      height: 70.h,
      child: Stack(
        children: [
          Positioned(
            left: 5.w,
            child: Container(
              width: 60.w,
              height: 60.h,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35.r),
                child: Image(
                  image: NetworkImage(profilePhotoUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
