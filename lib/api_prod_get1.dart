import 'dart:convert';
import 'dart:io';
import 'package:api_calls/urls.dart';
import 'package:http/http.dart';

//''
// ""
// =
// +
// {}
void main() async {

  String? searchItem = stdin.readLineSync();
  print("The entered searched is ${searchItem}");

  final Response apiResponse1 =
      await get(Uri.parse('$fakeStoreApi/products/?q=${searchItem}'));

  final decodedJson = jsonDecode(apiResponse1.body);
  print(decodedJson);
}
