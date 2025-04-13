import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sprint_learning/pages/secondpage.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  String? selectedItem = "Middle School";

  List<DropdownMenuEntry<String>> entries = [
    DropdownMenuEntry(value: "Middle School", label: "Middle School"),
    DropdownMenuEntry(value: "High School", label: "High School"),
    DropdownMenuEntry(value: "Higher Ed", label: "Higher Ed"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

              child: DropdownMenu(
                width: MediaQuery.of(context).size.width,
                initialSelection: entries[0].value,
                dropdownMenuEntries: entries,
                onSelected:
                    (value) => setState(() {
                      selectedItem = value;
                    }),
                textStyle: TextStyle(fontFamily: "Inter", fontSize: 32),
              ),
            ),

            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: OutlinedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.pushNamed(context, '/secondpage');
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
