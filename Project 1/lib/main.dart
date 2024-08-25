import 'package:alert/pages/Home-page.dart';
import 'package:alert/pages/login-page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,),
      darkTheme: ThemeData(brightness: Brightness.dark),

      initialRoute: "/login",
      routes: {
        "/login": (context) => LogInPage(),
        "/home": (context) => Homepage()
      },
    );
  }
}