import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorPage extends StatelessWidget {
  Map<String, dynamic> doctor;
  DoctorPage({super.key, required this.doctor});

  final primaryColor = const Color(0xff02012d);
  final secondaryColor = const Color(0xff1b2152);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: height * 0.1,
            ),
            Hero(
              tag: "${doctor['name']}",
              child: CircleAvatar(
                radius: height * 0.1,
                backgroundImage: NetworkImage(
                  "${doctor['image_address']}",
                ),
              ),
            ),
            SizedBox(
              height: height * 0.045,
            ),
            Text(
              "${doctor['name']}".toUpperCase(),
              style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            Text(
              "${doctor['degree']}",
              style: GoogleFonts.outfit(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.035),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: secondaryColor),
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                children: [
                  Text(
                    "${doctor['post']}".toUpperCase(),
                    style: GoogleFonts.outfit(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "${doctor['about']}",
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.outfit(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
