import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String name;
  String email;
  String password;
  String role;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "email": email,
      "password": password,
      "role": role,
    };
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snap){
    return UserModel(
        name: snap.get("name"),
        email: snap.get("email"),
        password: "not returned",//snap.get("password"),
        role: snap.get("role"),
    );
  }

  bool isAdmin(){
    return role == "admin";
  }
}