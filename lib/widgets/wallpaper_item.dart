import 'package:avenger_art/models/avenger.dart';
import 'package:avenger_art/widgets/parallax_flow_delegate.dart';
import 'package:flutter/material.dart';

class WallpaperItem extends StatefulWidget {
  const WallpaperItem({super.key, required this.avenger});

  final Avenger avenger;

  @override
  State<WallpaperItem> createState() => _WallpaperItemState();
}

class _WallpaperItemState extends State<WallpaperItem> {

  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(6),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: widget.avenger);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned(top: 0, bottom: 0, left: 0, right: 0 ,child: Flow(delegate: ParallaxFlowDelegate(
              scrollable: Scrollable.of(context)!,
            listItemContext: context,
            backgroundImageKey: _backgroundImageKey,
          ), children: [Image.network(widget.avenger.imageUrl.toString(), key: _backgroundImageKey, fit: BoxFit.cover,)],)),
              Positioned(bottom: 0, left: 0, right: 0 ,child: Container(
                color: Colors.black45,
                padding: const EdgeInsets.fromLTRB(16,0,16,0),
                child: Row(children: [
                  Expanded(child: Text(widget.avenger.name.toString(), style: const TextStyle(color: Colors.white, fontSize: 12),)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border, color: Colors.red,))
                ],),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
