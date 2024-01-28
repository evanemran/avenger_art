import 'dart:io';

import 'package:avenger_art/models/avenger.dart';
import 'package:download_pad/download_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:path_provider/path_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  void setWallpaper(String path) async {
    int location = WallpaperManager.BOTH_SCREEN; //can be Home/Lock Screen
    bool result = await WallpaperManager.setWallpaperFromFile(path, location);
    if(result == true) {
      print("Wallpaper Applied");
    }
    else {
      print("Failed");
    }
  }

  void startDownload(String imageUrl) async {
    String url = imageUrl;
    Directory path = await getApplicationDocumentsDirectory();
    String dir = path.path;
    DownloadPad.downloadFile(url, "wallpaper_.jpg", dir);
    setWallpaper("$dir/wallpaper_.jpg");
  }

  @override
  Widget build(BuildContext context) {

    final Avenger selectedAvenger = ModalRoute.of(context)!.settings.arguments as Avenger;

    return Stack(
      children: [
        Positioned(
          top: 0, bottom: 0, left: 0, right: 0,
            child: Image.network(
          selectedAvenger.imageUrl.toString(),
          fit: BoxFit.cover,
        )),

        Positioned(bottom: 0, left: 0, right: 0 ,child: TextButton(onPressed: () {
          startDownload(selectedAvenger.imageUrl.toString());
        }, style: TextButton.styleFrom(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black45),
          padding: const EdgeInsets.fromLTRB(16,16,16,42)
        ), child: const Text("Set Wallpaper", style: TextStyle(color: Colors.white, fontSize: 22),),))
      ],
    );
  }
}
