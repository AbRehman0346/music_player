import 'package:flutter/material.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/models/video_model.dart';
import 'package:music_player/route_generator.dart';
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
    List<VideoModel> data = List.generate(10, (int index){
      return VideoModel(
          videoId: "1rIllRxR07Gco6fZCiCiBTk_3JrKVKw6T",
          title: "Hot Video",
          thumbnail: "1eYFjCf2gAnVmCskIOicOOiI0_ydC6Ogj",
          ownerId: "developer123",
          views: 0,
          likes: 0,
          dislikes: 0,
          public: true,
      );
    });
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: const Text("Add Video"), onTap: (){
                Navigator.push(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.admin_AddVideo),),);
            },),
            ListTile(title: const Text("signup/signin"), onTap: (){
              Navigator.push(context, RouteGenerator.generateRoute(const RouteSettings(name: Routes.login)));
            },)
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index){
        String link = data[index].getFullThumbnailLink();
        String title = data[index].title;
        return GestureDetector(
          onTap: (){onPressed(data[index]);},
          child: ListTile(
            title: Image.network(link),
            subtitle: XText(title, size: 16, bold: true),
          ),
        );
      }),
    );
  }

  void onPressed(VideoModel model){
      Navigator.push(context, RouteGenerator.generateRoute(RouteSettings(name: Routes.playerScreen, arguments: model)));
  }

}
