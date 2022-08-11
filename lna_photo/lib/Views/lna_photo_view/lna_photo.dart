import 'package:flutter/material.dart';
import 'package:lna_photo/Views/gallery_view/gallery_view.dart';

class LnaPhoto extends StatefulWidget {
  const LnaPhoto({Key? key}) : super(key: key);

  @override
  State<LnaPhoto> createState() => _LnaPhotoState();
}

class _LnaPhotoState extends State<LnaPhoto> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [Text("LNA-Photo"), GalleryView()],
    );
  }
}
