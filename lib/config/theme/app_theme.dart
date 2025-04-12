import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class IAppTheme {
  ThemeData get themeData;
}

class AppTheme implements IAppTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );
}
