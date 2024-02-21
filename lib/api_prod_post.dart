//''
// ""
// =
// +
// {}

//variable to be uploaded
import 'dart:convert';

import 'package:http/http.dart';

var match = {
  "name": "shaaka",
  "price": 2800,
  "description": "This is product description!",
  "stock": 12,
  "images": [
    "https://unsplash.com/photos/person-taking-a-picture-underwater-RaOKzBtN8fI",
  ],
  "categories": ["iphone", "macbook"],
  "sku": "2023060001"
};

void main() async {
  //sending data
  String jsonString = jsonEncode(match);
  final Response apiResponsePost =
      await post(Uri.parse('https://fakestoreapi.com/products/'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonString);
  //printing response
  print(apiResponsePost.body);

  //getting the sent data
  final Response apiResponseGet =
      await get(Uri.parse('https://fakestoreapi.com/products/'));

  final decodedJson = jsonDecode(apiResponseGet.body);
  for (int i = 0; i < decodedJson.length; i++){
    print("${decodedJson[i]['id']}");//
  }
  
  //print(decodedJson);
}
