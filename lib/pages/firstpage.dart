import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sprint_learning/pages/secondpage.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(130, 0, 0, 0),
      drawer: Drawer(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Lets add your first class! Give us some info about it",
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Course Name",
                ),
                style: TextStyle(fontFamily: "Inter", fontSize: 32),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Education Level",
                ),
                style: TextStyle(fontFamily: "Inter", fontSize: 32),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: OutlinedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Secondpage()),
                  );
                },
                child: Icon(Icons.forward_outlined, size: 70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
