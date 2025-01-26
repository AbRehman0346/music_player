import 'package:music_player/models/user_model.dart';

class Constants{
  static UserModel? user;

  String owner = "developer123";
  static const int InternetOperationTimeoutInSeconds = 60;

  static String getLink(String id){
    return "https://drive.google.com/uc?id=$id";
  }
}

