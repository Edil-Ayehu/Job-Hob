import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/custom_btn.dart';
import 'package:jobhub/views/common/custom_textfield.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/reusable_text.dart';
import 'package:jobhub/views/ui/auth/signup.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: 'Login',
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(CupertinoIcons.arrow_left),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                HeightSpacer(size: 50),
                ReusableText(
                  text: 'Welcome Back!',
                  style: appstyle(
                    30,
                    Color(kDark.value),
                    FontWeight.w600,
                  ),
                ),
                ReusableText(
                  text: 'Fill the details to login to your account',
                  style: appstyle(
                    16,
                    Color(kDarkGrey.value),
                    FontWeight.w600,
                  ),
                ),
                HeightSpacer(size: 50),
                CustomTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  validator: (email) {
                    if (email!.isEmpty || !email.contains("@")) {
                      return "Please enter a valid email";
                    } else {
                      return null;
                    }
                  },
                ),
                HeightSpacer(size: 20),
                CustomTextField(
                  controller: passwordController,
                  obscureText: loginNotifier.obscureText,
                  keyboardType: TextInputType.text,
                  hintText: 'Password',
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return "Please enter a valid password";
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      loginNotifier.obscureText = !loginNotifier.obscureText;
                    },
                    child: Icon(
                      loginNotifier.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(kDark.value),
                    ),
                  ),
                ),
                HeightSpacer(size: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => RegistrationPage());
                    },
                    child: ReusableText(
                      text: "Register",
                      style: appstyle(
                        14,
                        Color(kDark.value),
                        FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                HeightSpacer(size: 50),
                CustomButton(
                  onTap: () {},
                  text: 'Login',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
