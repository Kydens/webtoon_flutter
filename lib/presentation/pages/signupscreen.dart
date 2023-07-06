import 'dart:typed_data';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../resources/auth_method.dart';
import '../../utils/color.dart';
import '../widget/text_field.dart';
import 'login.dart';
import 'main_page.dart';

class SignUpScreen extends StatefulWidget {
  static const ROUTE_NAME = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _screenSignUpScreenState();
}

class _screenSignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  // Uint8List? _image;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 110),
              child: Image.asset(
                'assets/images/webtoon.jpg',
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),

              //circular widget to acc and show our selected file
              // Stack(
              //   children: [
              //     _image != null
              //         ? CircleAvatar(
              //             radius: 64,
              //             backgroundImage: MemoryImage(_image!),
              //           )
              //         : const CircleAvatar(
              //             radius: 64,
              //             backgroundImage: NetworkImage(
              //               'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
              //             ),
              //           ),
              //     Positioned(
              //       bottom: -20,
              //       left: 80,
              //       child: IconButton(
              //         onPressed: selectImage,
              //         icon: const Icon(Icons.add_a_photo),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 24,
              // ),
              //text field input for username
              TextFieldIInput(
                textEditingController: _usernameController,
                hintText: 'Enter Your username',
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 24,
              ),
              //text field input for email
              TextFieldIInput(
                textEditingController: _emailController,
                hintText: 'Enter Your Email',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 24,
              ),
              //text field input for password
              TextFieldIInput(
                textEditingController: _passwordController,
                hintText: 'Enter Your Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 24,
              ),
              // TextFieldIInput(
              //   textEditingController: _bioController,
              //   hintText: 'Enter Your bio',
              //   textInputType: TextInputType.text,
              // ),
              SizedBox(
                height: 24,
              ),
              //button login
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    LoginScreen.ROUTE_NAME,
                  );
                },
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Sign Up'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: kSecondaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),

              // transitioning to signing up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Have an account?"),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        LoginScreen.ROUTE_NAME,
                      );
                    },
                    child: Container(
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
