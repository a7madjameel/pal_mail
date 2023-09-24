import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail/controllers/search_controller.dart';

import '../../../models/mail.dart';
class SearchScreen extends StatefulWidget {
  static String id = '/search_screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  late Future<List<Mail>> mail;
  List<Mail>? mails;
  String searchValue = '';
  bool isLoading = false;
  bool isZero = false;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  getSearch(String text)async{
    try {
      setState(() {
        isLoading = true;
      });
      List<Mail>? m = await SearchControllerA().getSearchResult(text);
      setState(() {
        mails = m;
        isLoading = false;
        isZero = m.isEmpty;
      });
      return m;
    }
    catch(e){
      print('error in getSearch $e');
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    // mail = SearchControllerA().getSearchResult();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:
        Text(
          'search',
          textAlign: TextAlign.start,
          style:
          GoogleFonts.poppins(fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 45,
                  width: 340,
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) async{
                      setState(() {
                        searchValue = value;
                        isSearching = value.length>0;

                      });
                      await getSearch(value);
                    },
                    onTap: () async {
                      await getSearch(searchValue);
                    },
                    style: const TextStyle(
                      color: Color(0xff020202),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "search",
                      suffixIcon: ClipOval(
                        child: IconButton(
                          icon: Icon(Icons.close,color: Colors.grey[700],),
                          onPressed: () {
                            setState(() {
                               searchController.clear();
                            });
                        },
                        ),
                      )
                      ,
                      hintStyle:  TextStyle(
                          color: Colors.grey[500],
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          decorationThickness: 6),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(onPressed: (){
                  },
                      icon: const Icon(Icons.filter_alt_outlined,size: 28,
                        color: Colors.blue,)),
                )
              ],
            ),
            const SizedBox(height: 20,),
            //  some additions (Like without search) All Inboxes use (getSearch) Method
            (isLoading&&isSearching)? const CircularProgressIndicator()
                :isZero? Text(
              'No mails found',
              textAlign: TextAlign.start,
              style:
              GoogleFonts.poppins(fontSize: 16.sp),
            )

            //*******************************************
            //*******************************************
            //  some additions (Like without search) All Inboxes use (getSearch) Method
            //Replace This Text
                :Text(
              'Fill Data Here',
              textAlign: TextAlign.start,
              style:
              GoogleFonts.poppins(fontSize: 16.sp),
            )
            //*********************************
            //*********************************
          ],
        ),
      ),
    );
  }
}


