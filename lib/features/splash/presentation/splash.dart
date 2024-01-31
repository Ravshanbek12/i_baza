import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer( const Duration(seconds: 4),(){
      Navigator.of(context).pushReplacementNamed('/profile_info');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Center(
          child: SvgPicture.asset("lib/assets/svg/i_baza.svg",width: 149.w,height: 48.h,),
        ),
        const CupertinoActivityIndicator(
          radius: 20,
          color: Colors.yellow,
        ),
      ],
    ));
  }
}
