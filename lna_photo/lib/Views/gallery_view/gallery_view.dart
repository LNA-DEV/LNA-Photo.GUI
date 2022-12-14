import 'package:flutter/material.dart';
import 'package:lna_photo/DataProviders/photo_api_data_provider.dart';
import 'package:lna_photo/Views/gallery_view/gallery_item.dart';
import 'package:lna_photo/Views/heading_view/heading_view.dart';

import '../../Models/photo.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  PhotoApiDataProvider dataProvider = PhotoApiDataProvider();

  @override
  Widget build(BuildContext context) {
    Future<List<Photo>> photos = dataProvider.getPhotoUrls();

    return FutureBuilder<List<Photo>>(
      future: photos,
      builder: (BuildContext context, AsyncSnapshot<List<Photo>> snapshot) {
        List<Widget> children = [];

        children.add(const Heading(
          text: "LNA-Photo",
        ));

        if (snapshot.hasData) {
          for (var element in snapshot.requireData) {
            GalleryItem item = GalleryItem(
              photo: element,
            );
            children.add(item);
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

        if (MediaQuery.of(context).size.width > 1000) {
          return GridView.count(
            crossAxisCount: 6,
            children: children,
          );
        } else {
          return ListView(
            children: children,
          );
        }
      },
    );
  }
}
