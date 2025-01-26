import 'package:flutter/material.dart';
import 'package:music_player/database/database.dart';
import 'package:music_player/models/uploadVideoModel.dart';
import 'package:music_player/xutils/xcheckbox.dart';
import 'package:music_player/xutils/xdialogs.dart';
import 'package:music_player/xutils/xtext.dart';
import 'package:music_player/xutils/xtextfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';

class AdminAddData extends StatefulWidget {
  const AdminAddData({super.key});

  @override
  State<AdminAddData> createState() => _AdminAddDataState();
}

class _AdminAddDataState extends State<AdminAddData> {
  final TextEditingController _videoLink = TextEditingController();
  final TextEditingController _imageLink = TextEditingController();
  final TextEditingController _videoTitle = TextEditingController();
  bool _videoPrivate = false;

  @override
  Widget build(BuildContext context) {
    Widget height(double size){
      return SizedBox(height: size);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Add Video")),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Video Title TextField
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: XTextField(
                  controller: _videoTitle,
                  label: "Video Title",
                ),
            ),

            height(10),

            // TextField video link.
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: XTextField(
                  controller: _videoLink,
                  label: "Video Link",
                ),
            ),

            height(10),

            // TextField Image Link.
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: XTextField(
                controller: _imageLink,
                label: "Thumbnail Image Link",
              ),
            ),

            height(10),

            //Checkbox
            XCheckBox(title: "Make Video Private", value: _videoPrivate, onChange: (change){
              setState(() {
                _videoPrivate = change ?? false;
              });
            }),

            height(10),

            // Add Button
            ElevatedButton(onPressed: onPressed, child: XText("Add Video")),
          ],
        ),
      ),
    );
  }

  void onPressed() async {
    String videoId = _videoLink.text.trim();
    String title = _videoTitle.text.trim();
    String thumbnail = _imageLink.text.trim();
    String owner = Constants().owner;
    bool private = _videoPrivate;

    if(videoId == ""){
      XDialogs().showSnackBar(context, content: "Video id field can't be empty");
      return;
    }

    if(title == ""){
      XDialogs().showSnackBar(context, content: "Title field can't be empty");
      return;
    }

    if(thumbnail == ""){
      XDialogs().showSnackBar(context, content: "Thumbnail field can't be empty");
      return;
    }

    // TODO: Special Case to handle...
    // if(title == owner){
    //   XDialogs().showSnackBar(context, content: "Owner field can't be empty");
    //   return;
    // }


    XDialogs.showProgressBar(context);
    try{
      await Database().addData(
          UploadVideoModel(
            videoId: videoId,
            title: title,
            thumbnail: thumbnail,
            ownerId: owner,
            views: 0,
            likes: 0,
            dislikes: 0,
            public: private,
          )).timeout(const Duration(seconds: Constants.InternetOperationTimeoutInSeconds),
          onTimeout: (){
            throw Exception("Could Not add video because of unknown error");
          }
      );
      if(mounted){
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Successfully Added Video.");
        Navigator.pop(context);
      }
    }catch(e, stacktrace){
      if(mounted){
        Navigator.pop(context);
        XDialogs.showDangerDialog(context, title: "Could not add video", content: e.toString());
      }
    }
  }
}
