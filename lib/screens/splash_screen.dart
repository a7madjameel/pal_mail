import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail/pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail/screens/app/home/home_screen.dart';
import 'package:pal_mail/screens/auth/login_screen.dart';

import '../core/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  static String id = '/splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      bool loggedIn = SharedPrefController()
              .getValueFor<bool>(key: PrefKeys.loggedIn.name) ??
          false;

      String route = loggedIn ? HomeScreen.id : LoginScreen.id;
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [
                Color(0xff003AFC),
                Color(0xff587FFF),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              palestineAsset,
              width: 76.w,
              height: 103.h,
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              'ديوان رئيس الوزراء',
              style: GoogleFonts.saira(
                fontSize: 30.sp,
                color: const Color(0xffFFFFFF),
              ),
            )
          ],
        ),
      ),
    );
  }
}
