import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dart_openai/dart_openai.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  final Future<String> _testfuture = Future<String>.delayed(
    const Duration(seconds: 2),
    () => "Hello World",
  );
  String base64file(List<int> bytes) => base64.encode(bytes);
  List<Widget> children = [];
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Upload documents pertaining to class content (pdfs, audio...)",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: "inter",
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(children: children),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: OutlinedButton(
                style: ButtonStyle(),
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  setState(() {
                    children.clear();
                    children.add(CircularProgressIndicator());
                  });
                  if (result != null) {
                    List<PlatformFile> files = result.files;
                    File file = File(files.first.path!);
                    List<int> bytes = await file.readAsBytes();
                    String decodedFile =
                        "data:image/png;base64,${base64file(bytes)}";
                    final usermessage = OpenAIChatCompletionChoiceMessageModel(
                      role: OpenAIChatMessageRole.user,
                      content: [
                        OpenAIChatCompletionChoiceMessageContentItemModel.text(
                          "I have uploaded a file. Can you summarize it?",
                        ),
                        OpenAIChatCompletionChoiceMessageContentItemModel.imageUrl(
                          decodedFile,
                        ),
                      ],
                    );
                    OpenAIChatCompletionModel chatCompletion = await OpenAI
                        .instance
                        .chat
                        .create(
                          model: "gpt-4o",
                          messages: [usermessage],
                          maxTokens: 100,
                          temperature: 0.7,
                        );
                    setState(() {
                      children.clear();
                      children.add(
                        Text(
                          chatCompletion.choices.first.message.content
                              .toString(),
                          style: TextStyle(fontSize: 32, fontFamily: "inter"),
                        ),
                      );
                    });

                    // Do something with the files
                  } else {
                    // User canceled the picker
                  }
                },
                child: Icon(Icons.upload, size: 70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
