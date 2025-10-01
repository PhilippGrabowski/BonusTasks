import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData get theme {
    final ThemeData data = ThemeData.light(useMaterial3: true);
    return data.copyWith(
      colorScheme: data.colorScheme.copyWith(primary: Color.fromARGB(255, 234, 113, 197)),
      textTheme: data.textTheme.copyWith(
        //24px
        headlineSmall: GoogleFonts.inter(
          textStyle: data.textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        //16px
        titleMedium: GoogleFonts.inter(
          textStyle: data.textTheme.titleMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        //16px
        bodyLarge: TextStyle(fontFamily: 'SFProText', fontWeight: FontWeight.w700),
        //13px
        bodyMedium: TextStyle(
          fontFamily: 'SFProText',
          color: Color.fromARGB(255, 235, 235, 245).withValues(alpha: 0.6),
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        //14px
        labelLarge: GoogleFonts.inter(
          textStyle: data.textTheme.labelLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        //12px
        labelMedium: TextStyle(fontFamily: 'SFProText', fontWeight: FontWeight.w600),
      ),
      snackBarTheme: data.snackBarTheme.copyWith(backgroundColor: Color.fromARGB(255, 234, 113, 197)),
    );
  }
}
