import 'package:flutter/material.dart';
import 'package:lna_photo/DataProviders/photo_api_data_provider.dart';
import 'package:lna_photo/Views/gallery_view/gallery_item.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  PhotoApiDataProvider dataProvider = PhotoApiDataProvider();

  @override
  Widget build(BuildContext context) {
    Future<List<String>> urls = dataProvider.getPhotoUrls();

    return FutureBuilder<List<String>>(
      future: urls,
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          List<GalleryItem> galleryItems = [];

          for (String element in snapshot.requireData) {
            GalleryItem item = GalleryItem(imageSource: element);
            galleryItems.add(item);
          }

          if (MediaQuery.of(context).size.width > 2000) {
            List<GalleryItem> Row1 = [];
            List<GalleryItem> Row2 = [];

            for (var i = 0; i < galleryItems.length; i++) {
              if (i.isOdd) {
                Row1.add(galleryItems[i]);
              } else {
                Row2.add(galleryItems[i]);
              }
            }

            children = [
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: Row1,
                  ),
                  Column(
                    children: Row2,
                  ),
                ],
              ),
            ];
          } else {
            children = [
              Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: galleryItems,
                  ),
                ],
              ),
            ];
          }
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }

        return ListView(
          children: children,
        );
      },
    );
  }
}
