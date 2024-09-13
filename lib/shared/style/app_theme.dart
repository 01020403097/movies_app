import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primary = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color gray = const Color(0xFF707070);
  static Color orange = const Color(0xFFFFB224);
  static Color scaffoldBackGround = const Color(0xFF1E1E1E);
  static Color containerColor = const Color(0xFF282A28);
  static Color grayBg = const Color(0XFF343534);
  static Color whiteColor = const Color(0XFFFFFFFF);
  static Color lightGray = const Color(0xFFB5B4B4);

  static ThemeData themeData = ThemeData(
    primaryColor: primary,
    cardColor: gray,
    scaffoldBackgroundColor: scaffoldBackGround,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: gray,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: orange,
      unselectedItemColor: primary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(color: orange),
      unselectedLabelStyle: TextStyle(color: primary),
      elevation: 0,
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.inter(fontSize: 15, color: whiteColor),
      bodySmall: GoogleFonts.poppins(fontSize: 10, color: lightGray),
      bodyMedium: GoogleFonts.poppins(fontSize: 10, color: whiteColor),
      bodyLarge: GoogleFonts.poppins(fontSize: 14, color: whiteColor),
    ),
  );
}
