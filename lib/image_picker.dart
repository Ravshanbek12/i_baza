import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
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

  List<File> files = [];

  Future<void> pickFile()async{
    final resualt = FilePicker.platform.pickFiles();
    if(resualt!=null){

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Plugins"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            child: Container(
              width: 150,
              height: 150,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: avatar == null
                  ? const Icon(Icons.person)
                  : Image.file(avatar!,fit: BoxFit.cover,),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            tooltip: "Read Image",
            onPressed:pickAvatar,
            child: const Icon(Icons.add),
          ),
      FloatingActionButton(
        onPressed:pickAvatar,
        tooltip: "Read File",
        child: const Icon(Icons.add_box_rounded),
      ),
        ],
      ),
    );
  }
}
