import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lna_photo/DataProviders/photo_api_data_provider.dart';
import 'package:lna_photo/Views/gallery_view/gallery_item.dart';
import 'package:lna_photo/Views/heading_view/heading_view.dart';

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
        List<Widget> children = [];

        children.add(const Heading(text: "LNA-Photo",));

        if (snapshot.hasData) {
          for (String element in snapshot.requireData) {
            GalleryItem item = GalleryItem(imageSource: element);
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
