import 'package:flutter/material.dart';
import 'package:lna_photo/DataProviders/photo_in_mem_data_provider.dart';
import 'package:lna_photo/Views/gallery_view/gallery_item.dart';

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

    List<GalleryItem> galleryItems = [];

    for (String element in urls) {
      GalleryItem item = GalleryItem(imageSource: element);
      galleryItems.add(item);
    }

    return ListView(
      children: galleryItems,
    );
  }
}
