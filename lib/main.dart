import 'package:adminpanel1/pages/home_page.dart';
import 'package:adminpanel1/pages/login.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const api_key = "AIzaSyBChrYOYakgbn43b8F_BQKOuOPWPm1PwwE";
// ignore: constant_identifier_names
const project_id = "flutter-food-app-zamon";

void main() {
  Firestore.initialize(project_id);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Admin Panel",
      home: const LoginPage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}
