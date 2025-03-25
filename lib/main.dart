import 'package:flutter/material.dart';
import 'package:sprint_learning/pages/firstpage.dart';
import 'package:sprint_learning/pages/secondpage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => SafeArea(child: child as Widget),
      debugShowCheckedModeBanner: false,
      home: Firstpage(),
      theme: ThemeData(
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          // ···
          brightness: Brightness.dark,
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: GoogleFonts.inter(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.inter(),
          displaySmall: GoogleFonts.inter(),
        ),
      ),
      routes: {
        '/firstpage': (context) => Firstpage(),
        '/secondpage': (context) => Secondpage(),
      },
    );
  }
}
