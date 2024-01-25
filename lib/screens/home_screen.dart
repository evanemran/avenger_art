import 'package:avenger_art/constants/app_strings.dart';
import 'package:avenger_art/models/avenger.dart';
import 'package:avenger_art/networks/requests.dart';
import 'package:flutter/material.dart';

import '../widgets/wallpaper_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.5;
    final double itemWidth = size.width / 3;

    Widget buildWallpapers(BuildContext context, List<Avenger> list) {
      return Container(
        margin: const EdgeInsets.only(left: 6, right: 6, top: 6),
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
          children: list.map((Avenger avenger) {
            return WallpaperItem(avenger: avenger,);
          }).toList(),
        ),
      );
    }

    FutureBuilder<List<Avenger>> getWallpapers(BuildContext context) {
      return FutureBuilder<List<Avenger>>(
        future: Requests().getAllAvengers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(AppStrings.errorMsg),
            );
          }
          else if (snapshot.connectionState == ConnectionState.done) {
            final List<Avenger>? posts = snapshot.data;
            return buildWallpapers(context, posts!);
          }
          else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        centerTitle: false,
        actions: [
          CircleAvatar(
            radius: 18.0, // Adjust the radius based on your requirement
            backgroundColor: Colors.white,
            child: IconButton(onPressed: () {}, icon: const Icon(
              Icons.person,
              size: 18.0, // Adjust the icon size based on your requirement
              color: Colors.red,
            ),)
          ),
          const SizedBox(width: 12,)
        ],
      ),
      body: getWallpapers(context),
    );
  }
}
