import 'dart:async' show Future;
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:lna_photo/Models/photo.dart';

class PhotoApiDataProvider {
  Future<List<String>> getPhotoUrls() async {
    List<String> photoUrls = [];

    var client = http.Client();

    Uri apiUri = Uri(
      path: "https://api.lna-dev.net/PersonalWebsite/Photo/",
      scheme: "https",
    );
    var response = await client.get(apiUri);

    List<Photo> result = json.decode(response.body.toString());

    for (var element in result) {
      photoUrls.add(element.url);
    }

    return photoUrls;
  }
}
