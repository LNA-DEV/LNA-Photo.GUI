import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lna_photo/Views/gallery_view/gallery_view.dart';

class LnaPhoto extends StatefulWidget {
  const LnaPhoto({Key? key}) : super(key: key);

  @override
  State<LnaPhoto> createState() => _LnaPhotoState();
}

class _LnaPhotoState extends State<LnaPhoto> {
  @override
  Widget build(BuildContext context) {
    return const GalleryView();
  }
}
