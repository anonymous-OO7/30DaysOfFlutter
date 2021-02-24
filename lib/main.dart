import 'package:flutter/material.dart';
import 'package:helloflutter/Pages/login_page.dart';
import 'package:helloflutter/Pages/home_page.dart';
import 'package:helloflutter/widgets/themes.dart';

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
      theme: MyTheme.lightTheme(context),
      //primaryTextTheme: GoogleFonts.latoTextTheme()),
      initialRoute: "/login",
      routes: {
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
