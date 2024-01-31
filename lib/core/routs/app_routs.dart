import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:i_baza/features/login/presentation/login.dart';
import 'package:i_baza/features/on_boarding/presentation/on_boarding.dart';
import 'package:i_baza/features/profile/profile_edite.dart';
import 'package:i_baza/features/profile/profile_info.dart';
import 'package:i_baza/features/splash/presentation/splash.dart';
import 'package:i_baza/image_picker.dart';

import '../../features/login/presentation/sign_up.dart';

abstract class AppRouts {
  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case '/onboarding':
        return CupertinoPageRoute(builder: (_) => const OnBoardingScreen());
      case '/signup':
        return CupertinoPageRoute(builder: (_)=>const SignUp());
      case '/imagepicker':
        return CupertinoPageRoute(builder: (_)=>const ImagePickerScreen());
      case '/profile_info':
        return CupertinoPageRoute(builder: (_)=>const ProfileScreen());
      case '/profile_edite':
        return CupertinoPageRoute(builder: (_)=>const ProfileEditeScreen());
      default:
        return CupertinoPageRoute(builder: (_)=>const SizedBox());
    }
  }
}
