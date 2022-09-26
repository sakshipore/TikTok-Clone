import 'package:get/get.dart';
import 'package:tik_tok_clone/router/routes_names.dart';
import 'package:tik_tok_clone/view/screens/add_video.dart';
import 'package:tik_tok_clone/view/screens/auth/login_screen.dart';
import 'package:tik_tok_clone/view/screens/auth/signup_screen.dart';
import 'package:tik_tok_clone/view/screens/home_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesNames.signUpScreen,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: RoutesNames.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutesNames.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RoutesNames.addVideo,
      page: () => AddVideoScreen(),
    ),
  ];
}
