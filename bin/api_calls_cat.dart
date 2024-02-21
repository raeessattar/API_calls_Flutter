import 'dart:convert';
import 'package:http/http.dart';

//''
// ""
// =
// +
// {}

void main() async {
  final Response apiResponseCat = await get(Uri.parse('https://fakestoreapi.com/products/'));
  final body = apiResponseCat.body;
  print(body.runtimeType);

  //final decodedJsonCat = jsonDecode(body);
  //print(body);
}