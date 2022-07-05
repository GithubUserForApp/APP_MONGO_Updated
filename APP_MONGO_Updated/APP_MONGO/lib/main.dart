import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mscapp/signup.dart';
import 'splash_screen.dart';
import 'event1.dart';
import 'event2.dart';
import 'signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.roboto().fontFamily),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'event1': (context) => Event1(),
        'event2': (context) => Event2(),
        'register':(context) =>MySignUpPage(),
      },
    );
  }
}
