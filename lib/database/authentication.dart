import 'package:music_player/constants.dart';
import 'package:music_player/database/database.dart';
import 'package:music_player/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(UserModel user) async {
    await _auth.createUserWithEmailAndPassword(email: user.email, password: user.password).
    timeout(
        const Duration(seconds: Constants.InternetOperationTimeoutInSeconds),
        onTimeout: (){
          throw Exception("Could not signup, Unknown Error Occurred");
        }
    );

    await Database().saveUserData(user);
    Constants.user = user;
  }


  Future<void> login(String email, String pass) async {
    await _auth.signInWithEmailAndPassword(email: email, password: pass).timeout(
        const Duration(seconds: Constants.InternetOperationTimeoutInSeconds),
        onTimeout: (){
          throw Exception("Could not signin, Unknown Error Occurred");
        }
    );
    Constants.user = await Database().getUserData(email: email);
  }
}