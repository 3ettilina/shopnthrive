import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopNThriveColors {
  static const Color darkOceanBlue = Color(0xFF1A5F7A);
  static const Color lightOceanBlue = Color(0xFF086E7D);
  static const Color brightYellowDuck = Color(0xFFFFC900);
  static const Color lightYellowHighlighter = Color(0xFFFFF89A);
  static const Color darkBlueDust = Color(0xBB30475E);
}

class ShopNThriveTheme {
  static TextTheme textTheme = TextTheme(
      headline1: GoogleFonts.secularOne(
          color: Colors.black, fontSize: 32, fontWeight: FontWeight.w700),
      headline2: GoogleFonts.secularOne(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
      headline3: GoogleFonts.secularOne(
          color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),
      headline4: GoogleFonts.secularOne(
          color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),
      headline5: GoogleFonts.secularOne(
          color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500),
      headline6: GoogleFonts.secularOne(
          color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500),
      bodyText1: GoogleFonts.tajawal(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
      bodyText2: GoogleFonts.tajawal(
          color: ShopNThriveColors.darkBlueDust,
          fontSize: 17,
          fontWeight: FontWeight.w400),
      caption: GoogleFonts.secularOne(
          color: Colors.black87, fontSize: 10, fontWeight: FontWeight.w700),
      button: GoogleFonts.staatliches(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ));

  static ThemeData themeData() => ThemeData(
      brightness: Brightness.light,
      primaryColor: ShopNThriveColors.darkOceanBlue,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
          backgroundColor: ShopNThriveColors.lightOceanBlue,
          centerTitle: true,
          titleTextStyle: GoogleFonts.secularOne(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600)),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: ShopNThriveColors.lightOceanBlue));
}
