import 'package:flutter/material.dart';
import 'package:lna_photo/Models/photo.dart';

import 'image_detail.dart';

class ImageDetailView extends StatefulWidget {
  const ImageDetailView({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  State<ImageDetailView> createState() => _ImageDetailViewState();
}

class _ImageDetailViewState extends State<ImageDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 93, 105),
        title: Text(widget.photo.name),
        actions: [
          IconButton(
            onPressed: () => {}, // TODO
            icon: const Icon(Icons.info),
          )
        ],
      ),
      body: ImageDetail(
        photo: widget.photo,
      ),
    );
  }
}
