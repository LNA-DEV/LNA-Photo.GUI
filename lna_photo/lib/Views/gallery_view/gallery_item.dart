import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../Models/photo.dart';
import '../image_detail_view/image_detail_view.dart';

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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetailView(photo: widget.photo),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Hero(
              tag: "image-detail-${widget.photo.name}",
              child: CachedNetworkImage(
                imageUrl: widget.photo.url,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
