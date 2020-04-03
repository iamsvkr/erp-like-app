import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/student.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  final _id = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _address = TextEditingController();

  void _add(String id, String password, String name, String address) async{
    final newStudent = Student(id: id, password: password, name: name, address: address);
    await Firestore.instance.collection("login").document("student").collection("auth").document(newStudent.id).setData({
      "id" : newStudent.id,
      "password" : newStudent.password,
      "name" : newStudent.name,
      "address" : newStudent.address
    });
    Navigator.pop(context);
  }

  _delete(String id, String password) async{
    await Firestore.instance.collection("login").document("student").collection("auth").document(id).delete();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Add Student"),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 8.0,
          child: Container(
            width: 300,
            height: 400,
            padding: EdgeInsets.all(16.0),
            child: Form(

              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _id,
                      decoration: InputDecoration(labelText: 'Id'),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      keyboardType: TextInputType.text,
                    ),
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(labelText: 'Name'),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      controller: _address,
                      decoration: InputDecoration(labelText: 'Address'),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: <Widget>[
                        InkWell(
                          child: RaisedButton(

                            child:
                            Text('ADD'),
                            onPressed: (){
                              _add(_id.text.toString(), _password.text.toString(), _name.text.toString(), _address.text.toString());
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding:
                            EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                            color: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).primaryTextTheme.button.color,
                          ),
                        ),
                        SizedBox(width: 30,),
                        InkWell(
                          child: RaisedButton(
                            child:
                            Text('DELETE'),
                            onPressed: (){
                              _delete(_id.text.toString(), _password.text.toString());
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding:
                            EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                            color: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).primaryTextTheme.button.color,
                          ),
                        ),
                      ],
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
