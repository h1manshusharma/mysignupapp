import "package:flutter/material.dart";
import 'package:mysignupapp/homepage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;

  late String name, email, mobile, college;

  void _sendToNextScreen() {
    if (_key.currentState!.validate()) {
      //save to global key
      _key.currentState!.save();
      //send to next screen
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => HomePage(
                    name: name,
                    mobile: mobile,
                    email: email,
                    college: college,
                  ))));
    } else {
      _autovalidate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _key,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(10.0)),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: TextFormField(
                      validator: (input) {
                        if (input == null) {
                          return "Enter name";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      onSaved: (input) => name = input!,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: TextFormField(
                      validator: (input) {
                        if (input == null) {
                          return "Enter Email";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      onSaved: (input) => email = input!,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: TextFormField(
                      validator: (input) {
                        if (input == null) {
                          return "Enter Mobile";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Mobile',
                      ),
                      onSaved: (input) => mobile = input!,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    title: TextFormField(
                      validator: (input) {
                        if (input == null) {
                          return "Enter College Name";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'College Name',
                      ),
                      onSaved: (input) => college = input!,
                    ),
                  ),
                  ButtonTheme(
                      child: RaisedButton(
                    onPressed: _sendToNextScreen,
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  )),
                ],
              ),
            )),
      ),
    );
  }
}
