import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadingData(
    String _title, String _heading, String _desc, bool _isFavourite) async {
  await FirebaseFirestore.instance.collection("products").add({
    'title': _title,
    'heading': _heading,
    'desc': _desc,
    'isFavourite': _isFavourite,
  });
}

Future<void> editProduct(bool _isFavourite, String id) async {
  await FirebaseFirestore.instance
      .collection("products")
      .doc(id)
      .update({"isFavourite": !_isFavourite});
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  await FirebaseFirestore.instance.collection("products").doc(doc.id).delete();
}
