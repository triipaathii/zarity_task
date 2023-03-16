import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final primaryColor = const Color(0xff02012d);
  final secondaryColor = const Color(0xff1b2152);

  final nameController = TextEditingController();
  final mobileController = TextEditingController();

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
              height: height * 0.1,
              width: width,
            ),
            Center(
              child: CircleAvatar(
                radius: height * 0.1,
                backgroundImage: const AssetImage("assets/images/anurag.jpg"),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Center(
              child: Text(
                "SELECT FROM",
                style: GoogleFonts.outfit(color: Colors.white),
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.image_rounded,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: width * 0.8,
              child: TextFormField(
                controller: nameController,
                style: GoogleFonts.outfit(color: Colors.white),
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: GoogleFonts.outfit(color: Colors.grey),
                    floatingLabelStyle: GoogleFonts.outfit(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff243b55), width: 2))),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: width * 0.8,
              child: TextFormField(
                controller: mobileController,
                style: GoogleFonts.outfit(color: Colors.white),
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: GoogleFonts.outfit(color: Colors.grey),
                    floatingLabelStyle: GoogleFonts.outfit(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff243b55), width: 2))),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1051E3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))),
                child: Text(
                  "SUBMIT",
                  style: GoogleFonts.outfit(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
