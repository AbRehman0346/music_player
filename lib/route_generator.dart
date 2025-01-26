import 'package:flutter/material.dart';
import 'package:music_player/screens/add_data.dart';
import 'package:music_player/screens/home.dart';
import 'package:music_player/screens/login.dart';
import 'package:music_player/screens/player_screen.dart';
import 'package:music_player/screens/register.dart';

import 'models/video_model.dart';

class Routes{
  static const String home = "/";
  static const String admin_AddVideo = "admin_add_video";
  static const String playerScreen = "player_screen";
  static const String register = "/register";
  static const String login = "login";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.home: //HomeScreen
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.admin_AddVideo: //Admin Add Video Screen
        return MaterialPageRoute(builder: (_) => const AdminAddData());
      case Routes.playerScreen: //Admin Add Video Screen
        return MaterialPageRoute(builder: (_) => PlayerScreen(video: args as VideoModel));
      case Routes.register:
        return MaterialPageRoute(builder: (_)=> Register());
      case Routes.login:
        return MaterialPageRoute(builder: (_)=>Login());
      default: //Error Screen
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Route Couldn't Found!",
        style: TextStyle(fontSize: 20),
        maxLines: 3,
      ),
    );
  }
}
