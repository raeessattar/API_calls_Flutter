import 'dart:convert';

import 'package:http/http.dart' as http;

//''
// ""
// =
// +
// {}

void main() async {
  //getting data from api and making object of album of one data
  Album albumGet1 = await fetchAlbum(4);
  print(albumGet1.id);
  print(albumGet1.userId);
  print(albumGet1.title);

  ///getting data from api and then making objects of Album using
  ///all the data from API called
  final responseGetAll =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  final decodedJson = jsonDecode(responseGetAll.body);
  //find the length of decodedJson(List type)
  int mapNumbers = decodedJson.length;
  List<Album> albumGetAll = [];
  Album loopAlbum;
  for (int i = 0; i < mapNumbers; i++) {
    loopAlbum = Album.fromJson(decodedJson[i]);
    albumGetAll.add(loopAlbum);
    print(albumGetAll[i].title);
  }
}

Future<Album> fetchAlbum(int collection) async {
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$collection'));

  //returing album
  return Album.fromJson(jsonDecode(response.body));
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> map) {
    return Album(userId: map["userId"], id: map["id"], title: map["title"]);
  }
}
