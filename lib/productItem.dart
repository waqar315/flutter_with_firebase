import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestoredatabase/operations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String title;
  final String heading;
  final String desc;
  final bool isFavourite;
  final String id;
  final DocumentSnapshot documentSnapshot;
  ProductItem({
    @required this.desc,
    @required this.documentSnapshot,
    @required this.id,
    @required this.isFavourite,
    @required this.title,
    @required this.heading,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            // Container(
            //   child: Expanded(
            //     child: Row(
            //       children: [
            //         Text(
            //           widget.desc,
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Container(
                          width: 210,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.heading,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Container(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 30,
                          child: IconButton(
                            onPressed: () {
                              editProduct(widget.isFavourite, widget.id);
                            },
                            icon: widget.isFavourite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.greenAccent,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.greenAccent,
                                  ),
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {
                        //     deleteProduct(widget.documentSnapshot);
                        //   },
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.redAccent,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ), ///////
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
      ),
    );
  }
}
