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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Align(
              alignment: Alignment.topLeft,
              child: BackButton(),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageDetail(
              photo: widget.photo,
            ),
          ],
        ),
      ]),
    );
  }
}
