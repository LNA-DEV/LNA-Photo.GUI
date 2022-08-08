import 'package:flutter/material.dart';
import 'package:lna_photo/DataProviders/photo_in_mem_data_provider.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  PhotoInMemDataProvider dataProvider = PhotoInMemDataProvider();

  @override
  Widget build(BuildContext context) {
    List<String> urls = dataProvider.getPhotoUrls();

    List<Image> images = [];

    for (var element in urls) {
      Image image = Image.network(element);
      images.add(image);
    }

    return ListView(
      children: images,
    );
  }
}
