/*Author: Hazim Shakri
Date: 5/12/2023
Purpose: To the initialRoute and routes for navigation of screens.
*/

//Reference: Lab nav_demo
import 'package:flutter/material.dart';
import 'AHomePage.dart';
import 'BAddGroup.dart';
import 'CAddMember.dart';
import 'DTakeAttendance.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AHomePage(),
      '/first': (context) => BAddGroup(),
        '/second': (context) => CAddMember(),
          '/third': (context) =>  DTakeAttendance(memberList: []),
      },
    );
  }
}
   