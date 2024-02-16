// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, library_private_types_in_public_api
/* 
   Author: Hazim Shakri
   Date: 5/12/2023
   Purpose: Creating Screen2: AddGroup for I-Attendancy Application
*/

import 'package:flutter/material.dart';
import 'CAddMember.dart';

class BAddGroup extends StatefulWidget {
  @override
  _BAddGroupState createState() => _BAddGroupState();
}

class _BAddGroupState extends State<BAddGroup> {
  //Refer Lab form_validate_demo
  TextEditingController nameController = TextEditingController();
  List<String> listOfOutputs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }
  //Appbar ontop
  AppBar buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [Color.fromARGB(255, 36, 103, 38), Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Text(
        'I-Attendancy App',
        style: TextStyle(
          fontSize: 23.0,
        ),
      ),
      centerTitle: true,
    );
  }
//Reference: Lab image_app
  Widget buildBody(BuildContext context) {
    return Container(
      // Insert image as background
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/attbackground1.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      //Add Group box childtitle
      child: Column(
        // To change the position of the box
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Add Group box
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 249, 178, 72),
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(
                color: Color.fromARGB(255, 249, 178, 72),
                width: 2.0,
              ),
            ),
            // To change the size of the box
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.groups_3_outlined,
                  size: 24,
                  color: Colors.black,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Add Group',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.0),
         //Reference: focus_field_demo
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Enter Group Name:',
              labelStyle: TextStyle(color: Colors.orange),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
            ),
          ),
          // Creating the key-in function
          //ask chatGPT
          ElevatedButton(
            onPressed: () {
              setState(() {
                String newOutput = nameController.text;
                if (newOutput.isNotEmpty) {
                  listOfOutputs.add(newOutput);
                  nameController.clear();
                }
              });
            },
            child: Text(
              'Click to Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
          ),
          SizedBox(height: 16.0),

          // Display the list of elevated buttons
          // with the delete option
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listOfOutputs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  // Creating background rectangle box
                  title: Container(
                    decoration: BoxDecoration(
                      // Background color behind the output box
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the next screen when output box is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return CAddMember();
                          }),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreen,
                        onPrimary: Colors.green,
                        padding: EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                      child: Row(
                        // Spacebetween is for repositioning the icon (left-end and right-end)
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // Icon rewrite on the left pane
                              IconButton(
                                icon: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    TextEditingController controller =
                                        TextEditingController(
                                            text: listOfOutputs[index]);

                                    // Creating a dialog box with a text field for editing
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Group Name'),
                                          content: TextField(
                                            controller: controller,
                                            decoration: InputDecoration(
                                              labelText: 'Edit Group Name:',
                                              labelStyle: TextStyle(color: Colors.green),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.green),
                                              )
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  // Update the item in listOfOutputs
                                                  listOfOutputs[index] =
                                                      controller.text;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Save',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  });
                                },
                              ),
                              SizedBox(width: 8.0),
                              // For clicking on the group name output
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return CAddMember();
                                    }),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  child: Text(
                                    listOfOutputs[index],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Delete button on the right
                          IconButton(
                            icon: Icon(
                              Icons.delete_outlined,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              // Remove output from the list
                              setState(() {
                                listOfOutputs.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}