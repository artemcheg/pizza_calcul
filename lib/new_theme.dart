import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme() => ThemeData(
      fontFamily: "Caveat",
      splashColor: Colors.green,
      backgroundColor: Color(0xFFF5F5F5),
      colorScheme: ColorScheme.fromSwatch(
              accentColor: Colors.tealAccent,
              primarySwatch: Colors.cyan,
              brightness: Brightness.light)
          .copyWith(secondary: Colors.teal),
      textTheme:  TextTheme(
          button: GoogleFonts.racingSansOne(textStyle:  const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)),
          bodyText1: const TextStyle(
            color: Colors.brown,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          bodyText2: const TextStyle(
            color: Colors.brown,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          headline6: const TextStyle(
            color: Colors.pinkAccent,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          headline5: const TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )
      ),

    );
