import 'package:final_exam_650710714/answer1.dart';
import 'package:final_exam_650710714/answer2.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/profile',
      routes: {
        '/profile': (context) => const Profile(),
        '/answer1': (context) => RegistrationForm(),
        '/answer2': (context) => CalculatorForm(),
      },
    );
  }
}
