import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/Screens/home_screen.dart';
import 'package:todo_app/custom_widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;

  void takeImageFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void chooseImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: Colors.lightBlue, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: photo == null,
                  replacement: CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.black,
                    backgroundImage: Image.file(File(photo?.path ?? "")).image,
                  ),
                  child: CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person, size: 170, color: Colors.blue),
                  ),
                ),

                SizedBox(height: 25),

                AppButton(
                  title: "Take a Picture From Camera",
                  onPressed: () {
                    takeImageFromCamera();
                  },
                ),

                SizedBox(height: 25),

                AppButton(
                  title: "Upload Photo From Gallery",
                  onPressed: () {
                    chooseImageFromGallery();
                  },
                ),

                SizedBox(height: 15),
                Divider(thickness: 2, color: Colors.lightBlue),
                SizedBox(height: 20),

                TextField(
                  onTapUpOutside: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Your Name",
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    disabledBorder: border,
                  ),
                ),
                SizedBox(height: 20),
                AppButton(
                  title: "Confirm",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                          (e) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}