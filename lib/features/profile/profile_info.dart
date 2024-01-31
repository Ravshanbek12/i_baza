import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _box = Hive.box("profile");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60.h,
        title: Icon(
          Icons.arrow_back,
          weight: 16.w,
          color: Color(0xFF383838),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Container(
              height: (257 / 810) * MediaQuery.of(context).size.height,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          child: Container(
                              width: 70.w,
                              height: 70.h,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: const Icon(Icons.person)),
                        ),
                        SizedBox(
                          width: 87.w,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed("/profile_edite");
                            },
                            icon: SvgPicture.asset("lib/assets/svg/edit.svg"))
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "F.I.Sh",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF9E9EA5),
                      ),
                    ),
                    Text(
                      _box.get("name")??"",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF383838),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Manzilingiz"??"",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF9E9EA5)),
                    ),
                    Text(
                      _box.get("location"),
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(
                          0xFF383838,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                height: 76.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Container(
                  height: 44.h,
                  margin: EdgeInsets.all(24.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color(0xFFFFEEEE),
                  ),
                  child: Center(
                    child: Text(
                      "Chiqish",
                      style:
                          TextStyle(fontSize: 14.sp, color: Color(0xFFF9524E)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
