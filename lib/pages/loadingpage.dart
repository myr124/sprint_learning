import 'package:flutter/material.dart';

class Loadingpage extends StatelessWidget {
  const Loadingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Spacer(), CircularProgressIndicator(), Spacer()],
      ),
    );
  }
}
