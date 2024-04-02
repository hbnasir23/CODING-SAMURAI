import 'dart:async';
import 'package:flutter/material.dart';
import 'note_list.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NoteList()),
      );
    });

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffbee8e5),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100, // Adjust the radius as needed
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Keep Notez',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

