import 'package:flutter/material.dart';
import 'package:music_player/xutils/xtext.dart';

class XDialogs{
  static void showProgressBar(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) => const AlertDialog(
        backgroundColor: Colors.transparent,
        content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Colors.black,
              ),
            ]),
      ),
    );
  }


  static void showDangerDialog(BuildContext context, {
    required String title,
    required String content,
    void Function()? onPressed,
    String buttonText = "OK",
  }){
    showDialog(context: context, builder: (context){
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(15),
        children: [
          XText(title,
            size: 20,
            bold: true,

          ),
          const SizedBox(height: 20),
          Text(content),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: null, child: Text(buttonText)),
            ],
          )
        ],
      );
    });
  }

  showSnackBar(BuildContext context, {
    required String content,
  }){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
  }
}