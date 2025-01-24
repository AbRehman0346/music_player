import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_player/admin_panel/database/collections.dart';
import 'package:music_player/admin_panel/models/uploadVideoModel.dart';

class AdminDatabase{
   // var db = FirebaseFirestore.instance;
   Future<void> addData(UploadVideoModel model) async {
     await Collections.videos.add(model.toMap()).onError(
       (error, stackTrace) {
          throw error ?? Exception("Unknown Error Occurred");
       },
     );
   }
}
