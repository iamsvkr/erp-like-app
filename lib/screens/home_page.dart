import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Home"),
      ),

      body: Container(
        child: Center(
          child: StreamBuilder(
           stream: Firestore.instance.collection("login").document("teacher").collection("news").snapshots(),
           builder: (context, snapshot) {
             if (!snapshot.hasData)
               return const Text("is loading....");
             return ListView.builder(
               itemCount: snapshot.data.documents.length,
               itemBuilder: (context, index) => ListTile(
                 title: Text(snapshot.data.documents[index]['title']),
               ),
             );
           },
          ),
        ),
      ),
    );
  }
}
