import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tik_tok_clone/controller/auth_controller.dart';
import 'package:tik_tok_clone/view/screens/auth/signup_screen.dart';
import 'package:tik_tok_clone/view/widgets/glitch.dart';
import 'package:tik_tok_clone/view/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlitchEffect(
              child: Text(
                "TikTok Clone",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.sp,
                ),
              ),
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
                controller: _passwordController,
                myIcon: Icons.lock,
                myLabelText: "Password",
                toHide: true,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ElevatedButton(
              onPressed: () {
                AuthController.instance.login(
                    _emailController.text.toString().trim(),
                    _passwordController.text.toString().trim());
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 50.h,
                  vertical: 10.h,
                ),
                child: Text(
                  "Login",
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              },
              child: Text(
                "New User? Click here",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
