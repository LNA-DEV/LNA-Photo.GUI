import 'dart:async' show Future;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lna_photo/Models/photo.dart';

class PhotoApiDataProvider {
  Future<List<String>> getPhotoUrls() async {
    List<String> photoUrls = [];

    var client = http.Client();

    Uri apiUri = Uri(
      host: "api.lna-dev.net",
      path: "PersonalWebsite/Photo/",
      scheme: "https",
    );
    var response = await client.get(apiUri);

    List<Photo> result = [];

    List<dynamic> map = json.decode(response.body.toString());

    for (var element in map) {
      result.add(Photo.fromJson(element));
    }

    for (var element in result) {
      photoUrls.add(element.url);
    }

    return photoUrls;
  }
}
