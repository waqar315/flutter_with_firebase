import 'package:firebase_core/firebase_core.dart';
import 'package:firestoredatabase/addProduct.dart';
import 'package:flutter/material.dart';
//import 'dart:async';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CrudFirestore());
}

class CrudFirestore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        AddUser.routeName: (ctx) => AddUser(),
      },
    );
  }
}
