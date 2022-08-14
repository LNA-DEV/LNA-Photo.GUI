import 'package:flutter/material.dart';
import '../../Models/photo.dart';
import '../image_detail/image_detail.dart';

class GalleryItem extends StatefulWidget {
  const GalleryItem({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  State<GalleryItem> createState() => _GalleryItemState();
}

class _GalleryItemState extends State<GalleryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetail(photo: widget.photo),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Hero(
              tag: "image-detail-${widget.photo.name}",
              child: Image.network(
                widget.photo.url,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
