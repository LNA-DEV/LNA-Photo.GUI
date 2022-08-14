import 'package:flutter/material.dart';

class ImageDetail extends StatefulWidget {
  const ImageDetail({Key? key, required this.imageSource}) : super(key: key);

  final String imageSource;

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "image-detail-${widget.imageSource}",
          child: Image.network(widget.imageSource),
        ),
      ),
    );
  }
}
