import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_player/database/collections.dart';
import 'package:music_player/models/uploadVideoModel.dart';
import 'package:music_player/models/user_model.dart';
import 'package:music_player/models/video_model.dart';

class Database{
   // var db = FirebaseFirestore.instance;
   Future<void> addData(UploadVideoModel model) async {
     await Collections.videos.add(model.toMap()).onError(
       (error, stackTrace) {
          throw error ?? Exception("Unknown Error Occurred");
       },
     );
   }

   Future<void> saveUserData(UserModel user) async {
     await Collections().users.add(user.toMap()).onError(
           (error, stackTrace) {
         throw error ?? Exception("Unknown Error Occurred");
       },
     );
   }


   Future<UserModel> getUserData({required String email}) async {
     QuerySnapshot querySnapshot = await Collections().users.where("email", isEqualTo: email).get();
     DocumentSnapshot doc = querySnapshot.docs.first;
     UserModel user = UserModel.fromDocumentSnapshot(doc);
     return user;
   }
   
   Future<void> increaseVideoView(String videoId) async {
     VideoModelFields fields = VideoModelFields();
     QuerySnapshot querySnapshot = await Collections.videos.where("video_id", isEqualTo: videoId).get();
     DocumentSnapshot doc = querySnapshot.docs.first;
     DocumentReference ref = doc.reference;
     await ref.update({
       fields.views: FieldValue.increment(1)
     });
   }
}
