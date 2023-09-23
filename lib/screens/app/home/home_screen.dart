import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail/screens/app/home/search_screen.dart';
import 'package:pal_mail/screens/app/home/status_consumer.dart';
import 'package:provider/provider.dart';
import '../../../controllers/auth_controller.dart';
import '../../../core/helper/api_helper.dart';
import '../../../core/helper/helper.dart';
import '../../../core/utils/constants.dart';
import '../../../providers/CategoryProvider.dart';
import '../../../providers/StatusProvider.dart';
import '../../../providers/mails_provider.dart';
import '../../../providers/tagsProvider.dart';
import '../../splash_screen.dart';
import 'advance_drawer.dart';
import 'consumer_expansion_tile.dart';
import 'consumer_tags.dart';

class HomeScreen extends StatefulWidget {
  static String id = '/home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Helper {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final _advancedDrawerController = AdvancedDrawerController();
  String content = '1';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<StatusProvider>(context, listen: false).getStatus();
      Provider.of<CategoryProvider>(context, listen: false).getAllCategory();
      Provider.of<MailProvider>(context, listen: false).getAllMails();
      Provider.of<TagsProvider>(context, listen: false).getAllTags();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: kPrimaryColor,
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: const AdvanceDrawer(),
      child: Scaffold(
        appBar: AppBar(
            leading: iconButtonDrawer(),
            centerTitle: true,
            title: Text(
              'Pal Mail',
              style: GoogleFonts.poppins(color: Colors.black),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchScreen.id);
                },
                icon: const Icon(Icons.search),
              ),
              SizedBox(
                width: 10.w,
              ),
              buildPopupMenuButton(),
              SizedBox(
                width: 15.w,
              ),
            ]),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              Provider.of<StatusProvider>(context, listen: false).getStatus();
              Provider.of<CategoryProvider>(context, listen: false)
                  .getAllCategory();
              Provider.of<MailProvider>(context, listen: false).getAllMails();
              Provider.of<TagsProvider>(context, listen: false).getAllTags();
            },
            key: _refreshIndicatorKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ConsumerStatusProvider(),
                  SizedBox(
                    height: 23.h,
                  ),
                  //TODO: Consumer with CategoryProvider & MailProvider
                  const ConsumerExpansionTile(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Tags',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17.sp,
                  ),
                  //TODO: Consumer with TagsProvider
                  const ConsumerTags(),
                  GestureDetector(
                    onTap: () {
                      _showModelNewIndex(context);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 16,
                            backgroundColor: kLightPrimaryColor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            'New Inbox ',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp, color: kLightPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///Todo: User logout
  Future<ApiHelper> userLogout(context) async {
    ApiHelper apiHelper = await AuthController().logout();
    if (apiHelper.success) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SplashScreen.id,
        (route) {
          return false;
        },
      );
    }
    showSnackBar(context,
        message: apiHelper.message, success: apiHelper.success);
    return apiHelper;
  }

  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton<String>(
      offset: Offset(-20.h, 20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      onSelected: (String value) {
        setState(() {
          content = value;
        });
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: '1',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: 35.r,
                      child: SvgPicture.asset(
                        appBarImage,
                        height: 60.h,
                      )),
                ),
                Center(
                    child: Text('Ahmed Jarad',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins())),
                Text(
                  'admin',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: kHintColor, height: 1.h),
                ),
              ],
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            value: '2',
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.language_outlined),
              title: Text(
                'English',
                style: GoogleFonts.poppins(color: kHintColor),
              ),
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            value: '3',
            child: ListTile(
              onTap: () {
                userLogout(context);
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.logout),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(color: kHintColor),
              ),
            ),
          ),
        ];
      },
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20.h,
          child: SvgPicture.asset(
            appBarImage,
            height: 60.h,
          )),
    );
  }

  /// Icon button for drawer
  IconButton iconButtonDrawer() {
    return IconButton(
      onPressed: () {
        _advancedDrawerController.showDrawer();
      },
      icon: ValueListenableBuilder<AdvancedDrawerValue>(
        valueListenable: _advancedDrawerController,
        builder: (_, value, __) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Icon(
              value.visible ? Icons.clear : Icons.menu_open_sharp,
              key: ValueKey<bool>(value.visible),
            ),
          );
        },
      ),
    );
  }

  ///
  Future<dynamic> _showModelNewIndex(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.r),
        ),
      ),
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: const Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.95,
                maxChildSize: 0.95,
                builder: (_, controller) {
                  return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.r)),
                      ),

                      ///Todo: add new Inbox
                      child: const NewInbox());
                },
              ),
            ),
          ),
        );
      },
    ).then((value) => value);
  }
}
