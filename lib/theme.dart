import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopNThriveColors {
  static Color primary = const Color(0xFF1A5F7A);
  static Color primaryAccent = const Color(0xFF086E7D);
  static Color secondary = const Color(0xFFFFC900);
  static Color secondaryAccent = const Color(0xFFFFF89A);
}

class ShopNThriveTheme {
  static TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.nunitoSans(
        color: Colors.black, fontSize: 32, fontWeight: FontWeight.w700),
    headline2: GoogleFonts.nunitoSans(
        color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
    headline3: GoogleFonts.nunitoSans(
        color: Colors.black, fontSize: 23, fontWeight: FontWeight.w500),
    headline4: GoogleFonts.nunitoSans(
        color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w500),
    headline5: GoogleFonts.nunitoSans(
        color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),
    bodyText1: GoogleFonts.quicksand(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
    bodyText2: GoogleFonts.quicksand(
        color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w400),
  );

  static ThemeData themeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: ShopNThriveColors.primary,
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF086E7D),
        centerTitle: true,
      ),
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: ShopNThriveColors.secondary));
}
