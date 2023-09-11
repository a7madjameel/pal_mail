import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail/pref/shared_pref_controller.dart';
import 'package:pal_mail/screens/app/home/home_screen.dart';
import 'package:pal_mail/screens/auth/auth_tab_bar.dart';
import 'package:pal_mail/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xffF7F6FF),
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xff003AFC),
                  surface: const Color(0xffB2B2B2),
                  secondary: const Color(0xff587FFF),
                ),
            appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              titleTextStyle: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              elevation: 0,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
          ),
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => const SplashScreen(),
            AuthTabBar.id: (context) => const AuthTabBar(),
            HomeScreen.id: (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
