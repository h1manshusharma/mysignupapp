import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name, mobile, email, college;

  HomePage({Key key, @required name, mobile, email, college}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Students Info"),
      ),
      body: Form(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(50.0),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text(
                  name,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                leading: Icon(Icons.mail),
                title: Text(email, style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(mobile, style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(college, style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
