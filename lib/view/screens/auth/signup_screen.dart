import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tik_tok_clone/view/widgets/glitch.dart';
import 'package:tik_tok_clone/view/widgets/text_input.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _setPasswordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100.h),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlitchEffect(
                child: Text(
                  "Welcome to TikTok",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/profile.jpg",
                    ),
                    radius: 60.r,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(3.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 30.h,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.h,
                ),
                child: TextInputField(
                  controller: _emailController,
                  myIcon: Icons.email,
                  myLabelText: "Email",
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.h,
                ),
                child: TextInputField(
                  controller: _setPasswordController,
                  myIcon: Icons.lock,
                  myLabelText: "Set Password",
                  toHide: true,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.h,
                ),
                child: TextInputField(
                  controller: _confirmPasswordController,
                  myIcon: Icons.lock,
                  myLabelText: "Confirm Password",
                  toHide: true,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.h,
                ),
                child: TextInputField(
                  controller: _emailController,
                  myIcon: Icons.person,
                  myLabelText: "Username",
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.h,
                    vertical: 10.h,
                  ),
                  child: Text(
                    "Sign Up",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}