import 'package:cloud_firestore/cloud_firestore.dart';

class Collections{
  static CollectionReference videos =  FirebaseFirestore.instance.collection("videos");
}