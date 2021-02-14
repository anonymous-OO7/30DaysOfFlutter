import 'package:flutter/material.dart';
import 'package:helloflutter/Pages/login_page.dart';
import 'package:helloflutter/home_page.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     // home: Homepage(),

      themeMode: ThemeMode.light,
      theme:ThemeData(
        primarySwatch:Colors.deepPurple,

        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      //primaryTextTheme: GoogleFonts.latoTextTheme()),
      darkTheme: ThemeData(
        brightness:Brightness.dark,
      ),
      initialRoute: "/login",
      routes: {
        "/home" : (context) =>Homepage(),
        "/login" : (context) =>LoginPage()
      },
    );
  }
}
