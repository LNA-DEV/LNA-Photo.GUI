import 'package:flutter/material.dart';
import 'package:lna_photo/Views/lna_photo_view/lna_photo.dart';

void main() {
  runApp(const LnaPhotoMain());
}

class LnaPhotoMain extends StatelessWidget {
  const LnaPhotoMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LnaPhoto(),
      ),
    );
  }
}
