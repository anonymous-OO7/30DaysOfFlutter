import 'package:flutter/material.dart';
import 'package:helloflutter/Pages/login_page.dart';
import 'package:helloflutter/home_page.dart';



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
      theme:ThemeData(primarySwatch:Colors.deepPurple),
      darkTheme: ThemeData(
        brightness:Brightness.dark,
      ),
      initialRoute: "/home",
      routes: {
        "/home" : (context) =>Homepage(),
        "/login" : (context) =>LoginPage()
      },
    );
  }
}
