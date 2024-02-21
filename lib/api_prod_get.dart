import 'dart:convert';

import 'package:http/http.dart';

//''
// ""
// =
// +
// {}
void main() async {
  final Response apiResponse =
      await get(Uri.parse('https://fakestoreapi.com/products/'));
  final body = apiResponse.body;
  print(body.runtimeType);
  final decodedJson = jsonDecode(body);

  //print(decodedJson);
  print('\n');
  for(int i = 0; i < decodedJson.length; i++ ){
    //print("${decodedJson[i]['title']},${decodedJson[i]['rating']}");
  }

  //i want to print all this using for each
  decodedJson.forEach((element) => {
    print("${element['title']},${element['rating']}")
  });
}
