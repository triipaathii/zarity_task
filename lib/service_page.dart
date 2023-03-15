import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicePage extends StatelessWidget {
  Map<String, dynamic> service;
  ServicePage({super.key, required this.service});

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
              tag: "${service['name']}",
              child: Image.network(
                "${service['image_address']}",
                height: height * 0.2,
              ),
            ),
            SizedBox(
              height: height * 0.045,
            ),
            Text(
              "${service['name']}".toUpperCase(),
              style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5),
            ),
            SizedBox(
              height: height * 0.045,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.035),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: secondaryColor),
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Text(
                "${service['description']}",
                style: GoogleFonts.outfit(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(
              height: height * 0.045,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1051E3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))),
                child: Text(
                  "BOOK",
                  style: GoogleFonts.outfit(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
