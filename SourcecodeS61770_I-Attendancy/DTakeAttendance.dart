// ignore_for_file: sort_child_properties_last, must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api

/* Author: Hazim Shakri
   Date: 6/12/2023
   Purpose: To create a Screen4: DTakeAttendance for I-Attendancy Application
*/

import 'package:flutter/material.dart';
import 'package:iattendancy_app/AHomePage.dart';
import 'package:intl/intl.dart'; //for date formatting

class DTakeAttendance extends StatefulWidget {
  final List<String> memberList;
  // Select icon by highlight
  Map<String, IconData?> selectedIcons = {};

  // Constructor that accepts the memberList parameter
  DTakeAttendance({required this.memberList});

  @override
  _DTakeAttendanceState createState() => _DTakeAttendanceState();
}

class _DTakeAttendanceState extends State<DTakeAttendance> {
  TextEditingController nameController = TextEditingController();
  String outputText = '';

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
    //Format the current date to display the month name
    String formattedDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
    return Container(
      // Insert image as background
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/attbackground1.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // To change the position of the box
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Put AddGroup and Add in the same box
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 249, 178, 72),
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(
                  color: const Color.fromARGB(255, 249, 178, 72), width: 2.0),
            ),
            // To change the size of the box
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_task, size: 24),
                SizedBox(width: 8.0),
                Text(
                  'Attendance',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16.0),

          // Date Format Box
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.0),
                border: Border.all(color: Colors.white)),
            child: Text(
              '$formattedDate',
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Handle the click on Enter Group Name:
          // Navigate to next screen
          //Refer Lab nav_demo
          outputText.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    // Navigate to the next screen when box is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return AHomePage();
                      }),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.person, size: 24),
                        const SizedBox(width: 8.0),
                        Text(
                          'Matric Number: $outputText',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
// to pass the data from CAddMember
//https://docs.flutter.dev/cookbook/navigation/passing-data
//refer the Lab: pass_data_demo
          Expanded(
            child: ListView.builder(
              itemCount: widget.memberList.length,
              itemBuilder: ((context, index) {
                //Select icon by highlight
                String memberName = widget.memberList[index];
                IconData? selectedIcon = widget.selectedIcons[memberName];

                return Container(
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
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.memberList[index]}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            for (IconData icon in [
                              Icons.check_circle_outline_outlined,
                              Icons.cancel_outlined,
                              Icons.email_outlined,
                              Icons.device_thermostat_outlined,
                            ])
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.selectedIcons[memberName] = icon;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    //Declare@select the icon
                                    //For every icon at the code below (1st,2nd,3nd,4rd)
                                    color: selectedIcon == icon
                                        //Highlight color
                                        ? Colors.yellow
                                        : const Color.fromARGB(
                                            255, 249, 178, 72),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  // (1st,2nd,3nd,4th)
                                  child: Icon(
                                    icon,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          //Creating a container to display the highlighted icon for each output
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(1.0),
                topRight: Radius.circular(1.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            //Creating icon inside the container (rectangle box)
            //https://api.flutter.dev/flutter/material/Icons-class.html
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildIconCount(Icons.check_circle_outline_outlined, 'Attend',
                    countIcons(Icons.check_circle_outline_outlined)),
                buildIconCount(Icons.cancel_outlined, 'Absent',
                    countIcons(Icons.cancel_outlined)),
                buildIconCount(Icons.email_outlined, 'Except',
                    countIcons(Icons.email_outlined)),
                buildIconCount(Icons.device_thermostat_outlined, 'Sick',
                    countIcons(Icons.device_thermostat_outlined)),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              //after user click the 'Finish Attendance'
              //to show the finish attendance dialog box
              _showFinishAttendanceDialog(context);
            },
            child: const Text(
              'Finish Attendance',
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

//Widget for buildIconCount

  Widget buildIconCount(IconData icon, String label, int count) {
    return Column(
      children: [
        Icon(
          icon,
          size: 24,
          color: Colors.black,
        ),
        const SizedBox(height: 8.0),
        Text(
          '$label: $count',
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

//This method calculates the count of occurrences of a specific icon
//asking chatGPT to change
  int countIcons(IconData icon) {
    return widget.selectedIcons.values
        .where((selectedIcon) => selectedIcon == icon)
        .length;
  }

//https://api.flutter.dev/flutter/material/showDialog.html
  void _showFinishAttendanceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Finish Attendance'),
          content:
              const Text('Are you sure you want to finish taking attendance?'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text(
                'No',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog and show 'Attendance Succeed' dialog
                Navigator.of(context).pop();
                _showAttendanceSucceedDialog(context);
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

//https://api.flutter.dev/flutter/material/showDialog.html
  void _showAttendanceSucceedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Attendance has been successfully recorded.'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog and navigate to AHomePage
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AHomePage();
                  }),
                );
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
