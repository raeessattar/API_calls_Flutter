import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  ///all the data from API called
  final responseGetAll =
      await http.get(Uri.parse('https://fakestoreapi.com/products/'));
  final List<dynamic> decodedJson = jsonDecode(responseGetAll.body);
  List<Product> productGetAll = [];

  //using .map
  Product mapLoopProduct;
  productGetAll = decodedJson.map((jsonData) {
    mapLoopProduct = Product.fromJson(jsonData);
    print(mapLoopProduct.userId);
    print(mapLoopProduct.title);
    print(mapLoopProduct.price);
    print(mapLoopProduct.description);
    print(mapLoopProduct.category);
    print(mapLoopProduct.image);
    print(mapLoopProduct.rating.rate);
    print(mapLoopProduct.rating.count);
    return mapLoopProduct;
  }).toList();

  //using for loop
  // Product forLoopProduct;
  // int mapNumbers = decodedJson.length;//length of decodedJson(List type)
  // for (int i = 0; i < mapNumbers; i++) {
  //   forLoopProduct = Product.fromJson(decodedJson[i]);
  //   productGetAll.add(forLoopProduct);
  //   print(productGetAll[i].userId);
  //   print(productGetAll[i].title);
  //   print(productGetAll[i].price);
  //   print(productGetAll[i].description);
  //   print(productGetAll[i].category);
  //   print(productGetAll[i].image);
  //   print(productGetAll[i].rating.rate);
  //   print(productGetAll[i].rating.count);
  // }
}

class Product {
  final int userId;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  const Product(
      {required this.userId,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      userId: map["id"],
      title: map["title"],
      price: map["price"],
      description: map["description"],
      category: map["category"],
      image: map["image"],
      rating: Rating.fromJson(map["rating"]),
    );
  }
}

//rating
class Rating {
  final num rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> mapRating) {
    return Rating(rate: mapRating["rate"], count: mapRating["count"]);
  }
}

