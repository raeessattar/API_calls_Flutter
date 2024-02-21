import 'dart:convert';
import 'package:http/http.dart';

//''
// ""
// =
// +
// {}

void main() async {
  final Response apiResponseCat = await get(Uri.parse('https://fakestoreapi.com/products/categories'));
  final body = apiResponseCat.body;
  print(body.runtimeType);
  final decodedJsonCat = jsonDecode(body);
  print(decodedJsonCat.runtimeType);

  //printing all list items
  print('\n');
  for(int i = 0; i < decodedJsonCat.length; i++ ){
    print(decodedJsonCat[i][0]);
    //print(decodedJsonCat[i]);
  }
}