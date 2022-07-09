import 'package:flutter/material.dart';
import 'quizpage.dart';
void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: quizpage(),
    );
  }
}
