import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/news.dart';

class AddNews extends StatefulWidget {
  @override
  _AddNewsState createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {

  final _id = TextEditingController();
  final _title = TextEditingController();
  final _description = TextEditingController();
  
  _add(String id, String title, String description) async{
    final news = News(id: id, title: title, description: description);
    await Firestore.instance.collection("login").document("teacher").collection("news").add({
      "id" : news.id,
      "title" : news.title,
      "description" : news.description
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add News"),
      ),

      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 8.0,
          child: Container(
            width: 300,
            height: 350,
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
                      controller: _title,
                      decoration: InputDecoration(labelText: 'Title'),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      controller: _description,
                      decoration: InputDecoration(labelText: 'Description'),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 15,),
                    InkWell(
                      child: RaisedButton(

                        child:
                        Text('ADD'),
                        onPressed: (){
                          _add(_id.text.toString(), _title.text.toString(), _description.text.toString());
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
