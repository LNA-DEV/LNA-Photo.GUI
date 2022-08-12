import 'package:flutter/material.dart';

class GalleryItem extends StatefulWidget {
  const GalleryItem({Key? key, required this.imageSource}) : super(key: key);

  final String imageSource;

  @override
  State<GalleryItem> createState() => _GalleryItemState();
}

class _GalleryItemState extends State<GalleryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            widget.imageSource,
            fit: BoxFit.cover,
          )),
    );
  }
}
