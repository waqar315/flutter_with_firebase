import 'package:firestoredatabase/operations.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  static const routeName = 'adduser';
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String id;
  TextEditingController postTitleController = TextEditingController();
  TextEditingController postHeadingController = TextEditingController();
  TextEditingController postDescController = TextEditingController();
  String title;
  String heading;
  String desc;
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD GADGETS"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                focusedBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid)),
                labelText: "Title",
                icon: Icon(
                  Icons.assignment,
                  color: Colors.orangeAccent,
                ),
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.green,
                )),
            onChanged: (value) {
              title = value;
            },
            controller: postTitleController,
          ),
          TextField(
            decoration: InputDecoration(
                focusedBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid)),
                labelText: "Heading",
                icon: Icon(
                  Icons.assignment,
                  color: Colors.orangeAccent,
                ),
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.green,
                )),
            onChanged: (value) {
              heading = value;
            },
            controller: postHeadingController,
          ),
          TextField(
            decoration: InputDecoration(
                focusedBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid)),
                labelText: "Write your topic in details",
                icon: Icon(
                  Icons.assignment,
                  color: Colors.orangeAccent,
                ),
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.green,
                )),
            onChanged: (value) {
              desc = value;
            },
            controller: postDescController,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 40),
                child: ElevatedButton(
                    onPressed: () {
                      uploadingData(title, heading, desc, isFavourite);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    )),
                // child: FlatButton(
                //   color: Colors.black,
                //   child: Text(
                //     "Add",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   onPressed: () {
                //     uploadingData(
                //         title, heading, desc, isFavourite);
                //     Navigator.of(context).pop();
                //   },
                // ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
