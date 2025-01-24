import 'package:flutter/material.dart';
import 'package:music_player/xutils/route_generator.dart';

import '../xutils/xdialogs.dart';
import '../xutils/xtext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: const Text("Add Video"), onTap: (){
                Navigator.push(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.admin_AddVideo),),);
            },)
          ],
        ),
      ),
      body: Center(
        child: SimpleDialog(
          contentPadding: const EdgeInsets.all(15),
          backgroundColor: Colors.grey,
          children: [
            XText("Could not add video",
              size: 20,
              bold: true,

            ),
            const SizedBox(height: 20),
            const Text("Could not add video because of a error."),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: null, child: Text("OK")),
              ],
            )
          ],
        ),
      )
    );
  }
}
