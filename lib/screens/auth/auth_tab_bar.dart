import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail/screens/auth/register_screen.dart';

import '../../core/utils/constants.dart';
import 'login_screen.dart';

class AuthTabBar extends StatefulWidget {
  static String id = '/tab_bar_view';

  const AuthTabBar({super.key});

  @override
  State<AuthTabBar> createState() => _AuthTabBarState();
}

class _AuthTabBarState extends State<AuthTabBar> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffeeeeee),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: -210.h,
            child: Container(
              width: 500.w,
              height: 790.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomStart,
                  colors: [
                    Color(0xff003AFC),
                    Color(0xff587FFF),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 47.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 47.h,
                    ),
                    Image.asset(
                      palestineAsset,
                      width: 56.w,
                      height: 60.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'ديوان رئيس الوزراء',
                      style: GoogleFonts.saira(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp,
                          color: const Color(0xffFFFFFF)),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: _tabController.index == 0 ? 10.h : 160.h,
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 40.h,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(55.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TabBar(
                      physics: const NeverScrollableScrollPhysics(),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: kPrimaryColor,
                      ),
                      unselectedLabelColor: kPrimaryColor,
                      labelColor: Colors.white,
                      controller: _tabController,
                      tabs: [
                        Container(
                            alignment: AlignmentDirectional.center,
                            width: 132.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: null,
                            ),
                            child: Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                              ),
                            )),
                        Container(
                          alignment: AlignmentDirectional.center,
                          width: 132.w,
                          height: 32.h,
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                      onTap: (int selectedTab) {
                        setState(() {
                          _tabController.index = selectedTab;
                        });
                      },
                    ),
                    IndexedStack(
                      index: _tabController.index,
                      children: [
                        Visibility(
                          visible: _tabController.index == 0,
                          child: const LoginScreen(),
                        ),
                        Visibility(
                          visible: _tabController.index == 1,
                          child: const RegisterScreen(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
