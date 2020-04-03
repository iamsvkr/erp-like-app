import 'package:flutter/material.dart';
import './add_news.dart';
import './add_student.dart';
import '../widgets/Menu.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class TeacherScreen extends StatefulWidget {
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Teacher's Screen"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.child_care),
              title: Text('Add/Delete Student'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddStudent()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.panorama),
              title: Text('Add/Delete News'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNews()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


}
