import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/PostDetailesPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'PostDetailesPage.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//connecting firebase firestore to my aap
//declaring some variable

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Post");

// colors

  Color gradiantStart = Colors.deepPurple;
  Color gradiantEnd = Colors.purple;
  passData(DocumentSnapshot snap) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostDetails(
              snapshot: snap,
            )));
  }

// overriding method to get data from firebase
  @override
  void initState() {
    super.initState();

    subscription = collectionReference.snapshots().listen((datasnashot) {
      setState(() {
        snapshot = datasnashot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter With Firebase"),
        actions: [
          IconButton(
              onPressed: () => debugPrint('Search Icone pressed'),
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () => debugPrint('Add Icone pressed'),
              icon: Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Syed Waqar Ahsan'),
                accountEmail: Text('waqarahsan513@gmail.com')),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
            ),
            //
            ListTile(
              title: Text("Services"),
              leading: Icon(Icons.design_services),
            ),
            //
            ListTile(
              title: Text("Project"),
              leading: Icon(Icons.work),
            ),
            //
            ListTile(
              title: Text("About Us"),
              leading: Icon(
                Icons.query_stats,
              ),
            ),
            //
            ListTile(
              title: Text("Contect"),
              leading: Icon(Icons.contact_mail),
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [gradiantStart, gradiantEnd],
          begin: const FractionalOffset(0.5, 0.0),
          end: const FractionalOffset(0.0, 0.5),
          stops: [0.0, 0.1],
        )),
        child: ListView.builder(itemBuilder: (context, index) {
          return Card(
              elevation: 0.0,
              color: Colors.transparent.withOpacity(0.1),
              margin: EdgeInsets.all(0.0),


              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,


                  children: [
                    CircleAvatar(
                      child: Text(snapshot[index].data["title"][0]),
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                    ),


                    SizedBox(width: 6.0),

                    Container(
                      width: 210.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          
                          InkWell(
                            child: Text(
                              snapshot[index].data["title"],
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.white),
                              maxLines: 1,
                            ),

                            onTap: () {
                              passData(snapshot[index]);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
