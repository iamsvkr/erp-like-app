import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './home_page.dart';
import './teacher_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _id = TextEditingController();
  final _password = TextEditingController();
  String dropdownValue = 'student';

  _login(String id, String password) async {
    var pass = await Firestore.instance
        .collection("login")
        .document(dropdownValue)
        .collection("auth")
        .document(id)
        .get();
    print("password : " + pass['password'].toString());
    if (password == pass['password'].toString()) {
      if (dropdownValue == "teacher") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TeacherScreen()),
        );
      } else if (dropdownValue == "student") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else if (dropdownValue == "admin") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } else {
      print("Errrrrrooorrrrrr");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 8.0,
          child: Container(
            width: 300,
            height: 300,
            padding: EdgeInsets.all(16.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.redAccent, 
                        shape: BoxShape.rectangle
                      ),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['student', 'teacher', 'admin']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _id,
                      decoration: InputDecoration(labelText: 'Id'),
                      keyboardType: TextInputType.number,
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Invalid id!';
                      //   }
                      // },
                      // onSaved: (value) {

                      // },
                    ),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      keyboardType: TextInputType.text,
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Invalid id!';
                      //   }
                      // },
                      // onSaved: (value) {

                      // },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      child: RaisedButton(
                        child: Text('LOGIN'),
                        onPressed: () {
                          _login(
                              _id.text.toString(), _password.text.toString());
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8.0),
                        color: Theme.of(context).primaryColor,
                        textColor:
                            Theme.of(context).primaryTextTheme.button.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
