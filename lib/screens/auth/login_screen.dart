import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail/screens/splash_screen.dart';

import '../../controllers/auth_controller.dart';
import '../../core/helper/api_helper.dart';
import '../../core/helper/helper.dart';
import '../../widgets/custom_app_btn.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helper {
  late TextEditingController _emailController;

  late TextEditingController _passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
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
                hintText: 'Enter Email',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12.sp,
                )),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
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
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomAppBtn(
            title: 'Login',
            onPressed: () {
              checkLoggedIn(context);
            },
          ),
        ],
      ),
    );
  }

  void checkLoggedIn(context) async {
    if (_formKey.currentState!.validate()) {
      ApiHelper apiHelper = await AuthController()
          .login(_emailController.text, _passwordController.text);
      if (apiHelper.success) {
        Navigator.pushReplacementNamed(context, SplashScreen.id);
      }
      showSnackBar(context,
          message: apiHelper.message, success: apiHelper.success);
    }
  }
}
