import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestoredatabase/addProduct.dart';
import 'package:firestoredatabase/productItem.dart';
//import 'package:firestoredatabase/showdata/HomePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.pages_outlined),
        title: Text(
          "Post",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        //stream: Firestore.instance.collection("products").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.docs[index];
                    return ProductItem(
                      documentSnapshot: data,
                      id: data.id,
                      isFavourite: data['isFavourite'],
                      desc: data['desc'],
                      title: data['title'],
                      heading: data['heading'],
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddUser.routeName);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
