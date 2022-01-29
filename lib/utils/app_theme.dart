import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme appTextTheme = TextTheme(
    headline1: GoogleFonts.lato(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline2: GoogleFonts.elMessiri(
      fontSize: 62,
      fontWeight: FontWeight.w700,
      color:  Colors.white,
    ),
    headline3: GoogleFonts.elMessiri(
      fontSize: 50,
      fontWeight: FontWeight.w200,
      color:  Colors.white,
    ),
    headline4: GoogleFonts.lato(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline5: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.lato(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    button: TextStyle(
      fontFamily: 'SfPro',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.blue,
    ),

  );
}