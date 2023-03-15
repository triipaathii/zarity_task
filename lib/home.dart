import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zarity_task/doctor_page.dart';
import 'package:zarity_task/service_page.dart';

import 'data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final primaryColor = const Color(0xff02012d);
  final secondaryColor = const Color(0xff1b2152);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    bool viewMoreFutureServices = false;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.07,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/anurag.jpg",
                        height: height * 0.055,
                        width: height * 0.055,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Good Afternoon\n",
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Anurag Tripathi",
                                style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.message_outlined,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            ),
            SizedBox(height: height * 0.035),
            Container(
              padding: EdgeInsets.all(height * 0.05),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.08,
                    child: CircularPercentIndicator(
                      radius: height * 0.04,
                      percent: 0.7,
                      progressColor: Colors.amber,
                      backgroundColor: secondaryColor,
                      center: Text(
                        "70%",
                        style: GoogleFonts.outfit(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.07,
                  ),
                  Text(
                    "Please complete your profile\nto book consultations",
                    style:
                        GoogleFonts.outfit(color: Colors.white, fontSize: 13),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.035),
            Text(
              "Services",
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(height: height * 0.02),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              for (var service in services) ...[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServicePage(
                                  service: service,
                                )));
                  },
                  child: Container(
                    width: width * 0.29,
                    height: height * 0.18,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: "${service['name']}",
                          child: Image.network(
                            "${service['image_address']}",
                            height: height * 0.07,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Text(
                          "${service['name']}".toUpperCase(),
                          style: GoogleFonts.outfit(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ]),
            SizedBox(height: height * 0.035),
            Text(
              "Advisory Board",
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(height: height * 0.02),
            Container(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.035, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    "${doctors[index]['image_address']}",
                                    height: height * 0.08,
                                    width: height * 0.08,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${doctors[index]['name']}",
                                      style: GoogleFonts.outfit(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.005,
                                    ),
                                    Text(
                                      "${doctors[index]['post']}",
                                      style: GoogleFonts.outfit(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DoctorPage(
                                                doctor: doctors[index],
                                              )));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff1051E3),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100))),
                                child: Text(
                                  "View",
                                  style:
                                      GoogleFonts.outfit(color: Colors.white),
                                ))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, _) {
                      return Divider(
                        color: primaryColor,
                        thickness: 3,
                      );
                    },
                    itemCount: doctors.length)),
            SizedBox(
              height: height * 0.05,
            ),
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.01),
                      child: Text(
                        "Future Services",
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.035, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    "${futureServices[index]['image_address']}",
                                    height: height * 0.08,
                                    width: height * 0.08,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${futureServices[index]['name']}",
                                        style: GoogleFonts.outfit(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        "${futureServices[index]['description']}",
                                        softWrap: false,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.outfit(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, _) {
                          return Divider(
                            color: primaryColor,
                            thickness: 3,
                          );
                        },
                        itemCount:
                            viewMoreFutureServices ? futureServices.length : 3),
                    Divider(
                      color: primaryColor,
                      thickness: 3,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              viewMoreFutureServices = !viewMoreFutureServices;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff1051E3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          child: Text(
                            viewMoreFutureServices ? "View less" : "View More",
                            style: GoogleFonts.outfit(color: Colors.white),
                          )),
                    )
                  ],
                ),
              );
            }),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
