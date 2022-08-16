import 'package:flutter/material.dart';
import '../../Models/photo.dart';

class ImageDetail extends StatefulWidget {
  const ImageDetail({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "image-detail-${widget.photo.name}",
        child: Image.network(
          widget.photo.url.replaceAll("-Prev.webp", ".JPG"),
          filterQuality: FilterQuality.none,
          fit: BoxFit.contain,
          loadingBuilder: ((context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return const CircularProgressIndicator.adaptive();
          }),
        ),
      ),
    );
  }
}
