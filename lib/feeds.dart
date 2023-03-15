import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Feeds extends StatelessWidget {
  const Feeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "FEEDS SCREEN",
        style: GoogleFonts.outfit(
          color: Colors.white
        ),
      ),
    );
  }
}