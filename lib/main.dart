import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:sprint_learning/pages/firstpage.dart';
import 'package:sprint_learning/pages/homepage.dart';
import 'package:sprint_learning/pages/loadingpage.dart';
import 'package:sprint_learning/pages/secondpage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  OpenAI.apiKey =
      "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";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
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
          surface: Color(0x001e1e1e),
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
        'homepage': (context) => Homepage(),
        'loadingpage': (context) => Loadingpage(),
      },
    );
  }
}
