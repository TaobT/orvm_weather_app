import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/home/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                Colors.blue.shade100,
                Colors.blue.shade300,
                Colors.blue.shade500
              ])
            ),
            child: const SafeArea(child: HomeScreen()),
          )
        ),
      ),
    );
  }
}