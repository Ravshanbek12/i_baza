import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:i_baza/features/profile/profile_info.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileEditeScreen extends StatefulWidget {
  const ProfileEditeScreen({super.key});

  @override
  State<ProfileEditeScreen> createState() => _ProfileEditeScreenState();
}

class _ProfileEditeScreenState extends State<ProfileEditeScreen> {
  final _box = Hive.box("profile");
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  File? avatar;

  Future<void> pickAvatar() async {
    ImagePicker imagePicker = ImagePicker();

    final file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        avatar = File.fromUri(Uri.file(file.path));
      });
    }
  }

  @override
  void initState() {
    nameController.text = _box.get("name");
    locationController.text = _box.get("location");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F8FC),
      appBar: AppBar(
        toolbarHeight: 60.h,
        title: Center(
            child: Text(
          "Profilni tahrirlash",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF383838)),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              height: (348 / 812) * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Center(
                        child: GestureDetector(
                      onTap: pickAvatar,
                      child: Align(
                        child: Container(
                          width: 70.w,
                          height: 70.h,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: avatar == null
                              ? const Icon(Icons.person)
                              : Image.file(
                                  avatar!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "F.I.Sh",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF383838),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFF2F3F5),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: const Color(0xFFF2F3F5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: const Color(0xFFF2F3F5),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: const Color(0xFFF2F3F5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: const Color(0xFFF2F3F5),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: const Color(0xFFF2F3F5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Manzilingiz",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF383838),
                      ),
                    ),
                    TextField(
                      controller: locationController,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFF2F3F5),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: const Color(0xFFF2F3F5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: const Color(0xFFF2F3F5),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: const Color(0xFFF2F3F5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: const Color(0xFFF2F3F5),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: const Color(0xFFF2F3F5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: (174/812)*MediaQuery.of(context).size.height,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              width: MediaQuery.of(context).size.width,
              height: 48.h,
              decoration: BoxDecoration(
                color: Color(0xFFF0CB23),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith((states) => 0),
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Color(0xFFF0CB23))
                ),
                onPressed: (){
                setState(() {
                  _box.put("name", nameController.text);
                  _box.put("location", locationController.text);
                });
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
              child: const Text("Saqlash",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF383838)),),),
            )
          ],
        ),
      ),
    );
  }
}
