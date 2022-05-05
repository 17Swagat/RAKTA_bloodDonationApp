import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData myLightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        // fontFamily: GoogleFonts.lato().fontFamily,
        // primaryTextTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          // textTheme: Theme.of(context).textTheme, :-> Depreceated
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
  );

  static ThemeData myDarkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,  
  );
}
