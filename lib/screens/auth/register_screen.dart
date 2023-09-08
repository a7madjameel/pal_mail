import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/auth_controller.dart';
import '../../core/helper/api_helper.dart';
import '../../core/helper/helper.dart';
import '../../core/utils/constants.dart';
import '../../widgets/custom_app_btn.dart';
import '../splash_screen.dart';

class RegisterScreen extends StatefulWidget {
  static String id = '/register_screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helper {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter name';
                } else if (value!.length < 4) {
                  return 'you have to enter at least 4 digit!';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: 'name',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12.sp,
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (EmailValidator.validate(value!)) {
                  return null;
                } else {
                  return 'Please enter the email';
                }
              },
              decoration: InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12.sp,
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter password';
                } else if (value!.length < 6) {
                  return 'you have to enter at least 6 digit!';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12.sp,
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter password';
                } else if (value!.length < 6) {
                  return 'you have to enter at least 6 digit!';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomAppBtn(
              title: 'Sign Up',
              onPressed: () {
                checkSignUp(context);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'OR',
              style: GoogleFonts.poppins(
                  fontSize: 14.sp, color: const Color(0xffA8A7A7)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(facebookImage, height: 20.h),
                SvgPicture.asset(twitterImage, height: 20.h),
                SvgPicture.asset(googleImage, height: 20.h),
              ],
            )
          ],
        ),
      ),
    );
  }

  void checkSignUp(context) async {
    Map<String, dynamic> body = {
      'email': _emailController.text,
      'password': _passwordController.text,
      'password_confirmation': _confirmPasswordController.text,
      'name': _nameController.text,
    };
    if (_formKey.currentState!.validate()) {
      ApiHelper apiHelper = await AuthController().register(body: body);
      if (apiHelper.success) {
        Navigator.pushReplacementNamed(context, SplashScreen.id);
      }
      showSnackBar(context,
          message: apiHelper.message, success: apiHelper.success);
    }
  }
}
