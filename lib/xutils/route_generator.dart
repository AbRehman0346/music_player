import 'package:flutter/material.dart';
import 'package:music_player/admin_panel/admin_add_data.dart';
import 'package:music_player/screens/home.dart';

class Routes{
  static const String home = "/";
  static const String admin_AddVideo = "admin_add_video";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.home: //HomeScreen
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.admin_AddVideo: //Admin Add Video Screen
        return MaterialPageRoute(builder: (_) => const AdminAddData());
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
