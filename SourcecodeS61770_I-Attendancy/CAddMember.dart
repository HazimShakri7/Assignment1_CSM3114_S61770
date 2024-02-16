// ignore_for_file: sort_child_properties_last, unnecessary_string_interpolations, library_private_types_in_public_api, use_key_in_widget_constructors

/* Author: Hazim Shakri
   Date: 6/12/2023
   Purpose: To create a Screen3: CAddMember for I-Attendancy Application
*/

import 'package:flutter/material.dart';
import 'DTakeAttendance.dart';

class CAddMember extends StatefulWidget {
  @override
  _CAddMemberState createState() => _CAddMemberState();
}

class _CAddMemberState extends State<CAddMember> {
  TextEditingController nameController = TextEditingController();
  // To make a list for output
  List<String> memberList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 36, 103, 38), Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      backgroundColor: Colors.green,
      title: const Text(
        'I-Attendancy App',
        style: TextStyle(
          fontSize: 23.0,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      // Insert an image as background
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/attbackground1.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // To change the position of the box
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Put AddGroup and Add in the same box
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 249, 178, 72),
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(
                color: const Color.fromARGB(255, 249, 178, 72),
                width: 2.0,
              ),
            ),
            // To change the size of the box
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 24),
                SizedBox(width: 8.0),
                Text(
                  'Add Member',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16.0),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Matric Number:',
              labelStyle: TextStyle(color: Colors.orange),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
            ),
          ),
          // Creating the key-in function
          ElevatedButton(
            onPressed: () {
              setState(() {
                // Adding the entered Matric Number to the list
                memberList.add(nameController.text);
                // Clear the text field after adding to the list
                nameController.clear();
              });
            },
            child: const Text(
              'Click to Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
          ),
          const SizedBox(height: 16.0),
          // Display the entered Matric Number in a list in rectangle boxes
          // Unlimited list using ListView.builder with the length of memberList.length.
          Expanded(
            child: ListView.builder(
              itemCount: memberList.length,
              itemBuilder: (context, index) {
                // Perform a delete function
                // Slide left to delete the mistaken matric number
                //https://api.flutter.dev/flutter/widgets/Dismissible-class.html
                return Dismissible(
                  key: Key(memberList[index]),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    // Remove the dismissed item from the list
                    setState(() {
                      memberList.removeAt(index);
                    });
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Container(
                    // Spacing between the matric number
                    margin: const EdgeInsets.symmetric(vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(color: Colors.lightGreen, width: 2.0),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        size: 24,
                        color: Colors.white,
                      ),
                      // The matric number (output)
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${memberList[index]}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          // Adding icon on the right of the matric number output
                          const Icon(
                            Icons.swipe_left,
                            size: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Adding ElevatedButton for Take Attendance
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  // To pass the list of entered matric numbers to DTakeAttendance page
                  return DTakeAttendance(memberList: memberList);
                }),
              );
            },
            child: const Text(
              'Take Attendance',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}