// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

/* Author: Hazim Shakri
   Date: 5/12/2023
   Purpose: To create a HomePage for I-Attendancy Application
*/

import 'package:flutter/material.dart';

class AHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //https://api.flutter.dev/flutter/painting/LinearGradient-class.html
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 36, 103, 38), Colors.lightGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'I-Attendancy App',
          style: TextStyle(
            fontSize: 23.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      // Inserting image in background
      // Reference: Lab image_app
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/attbackground1.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.9),
              BlendMode.dstATop,
            ),
          ),
        ),
              // To add the Attendance Icon
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ////https://api.flutter.dev/flutter/material/Icons-class.html
              Icon(
                //
                Icons.co_present_rounded,
                size: 130.0,
                color: Colors.black,
              ),
              // 'Get Started' ElevatedButton
              //https://api.flutter.dev/flutter/material/ElevatedButton-class.html
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 249, 178, 72),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    side: BorderSide(color: Colors.lightGreen, width: 2.0),
                  ),
                  // To change the size of 'Get Started' ElevatedButton
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
                ),
                onPressed: () {
                  // Navigated to Screen 2: AddGroup
                  // Refer the Lab nav_demo
                  Navigator.pushNamed(
                    context,
                    '/first',
                  );
                },
                // To change the size of 'Get Started' and also the size of the button
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // To add the text below the 'Get Started' ElevatedButton
              Text(
                'Welcome to I-Attendancy, your ultimate solution for seamless and intelligent attendance tracking!',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
