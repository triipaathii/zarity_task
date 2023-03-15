import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:zarity_task/home.dart';

import 'aid.dart';
import 'feeds.dart';
import 'reports.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final primaryColor = const Color(0xff02012d);
  final secondaryColor = const Color(0xff1b2152);

  int pageSelected = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: primaryColor));

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: primaryColor,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Container(
            height: height * 0.13,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: pageSelected == 0
                              ? const Color(0xff1051E3)
                              : const Color(0xffD9D9D9).withOpacity(0.1)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              pageSelected = 0;
                            });
                          },
                          icon: const Icon(
                            Icons.home,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "Home",
                      style: GoogleFonts.outfit(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: pageSelected == 1
                              ? const Color(0xff1051E3)
                              : const Color(0xffD9D9D9).withOpacity(0.1)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              pageSelected = 1;
                            });
                          },
                          icon: const Icon(
                            Icons.ads_click_rounded,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "Feeds",
                      style: GoogleFonts.outfit(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: pageSelected == 2
                              ? const Color(0xff1051E3)
                              : const Color(0xffD9D9D9).withOpacity(0.1)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              pageSelected = 2;
                            });
                          },
                          icon: const Icon(
                            Icons.event_note_rounded,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "Reports",
                      style: GoogleFonts.outfit(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: pageSelected == 3
                              ? const Color(0xff1051E3)
                              : const Color(0xffD9D9D9).withOpacity(0.1)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              pageSelected = 3;
                            });
                          },
                          icon: const Icon(
                            Icons.medical_services_rounded,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "Aid",
                      style: GoogleFonts.outfit(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: pageSelected == 0
            ? const Home()
            : pageSelected == 1
                ? const Feeds()
                : pageSelected == 2
                    ? const Reports()
                    : const Aid());
  }
}
