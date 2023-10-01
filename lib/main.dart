import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp_crud/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return   MaterialApp(home: HomePage(),debugShowCheckedModeBanner: false,);
  }
}