import 'dart:convert';

import 'package:http/http.dart';
//''
// ""
// =
// +
// {}
void main() async {
  final Response apiResponse = await get(Uri.parse('https://fakestoreapi.com/products/'));
  final body = apiResponse.body;
  print(body.runtimeType);
  final decodedJson = jsonDecode(body);
  print(decodedJson.runtimeType);
}

