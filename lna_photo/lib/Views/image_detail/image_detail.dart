import 'package:flutter/material.dart';
import 'package:lna_photo/Models/photo.dart';

class ImageDetail extends StatefulWidget {
  const ImageDetail({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: BackButton(),
          ),
          Center(
            child: Hero(
              tag: "image-detail-${widget.photo.name}",
              // TODO child: Image.network(widget.photo.url.replaceAll("-Prev.webp", ".JPG")),
              child: Image.network(
                widget.photo.url,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
