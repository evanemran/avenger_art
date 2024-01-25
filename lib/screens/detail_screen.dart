import 'package:avenger_art/models/avenger.dart';
import 'package:flutter/cupertino.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {

    final Avenger selectedAvenger = ModalRoute.of(context)!.settings.arguments as Avenger;

    return Image.network(
        selectedAvenger.imageUrl.toString(),
      fit: BoxFit.cover,
    );
  }
}
