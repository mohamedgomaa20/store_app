import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class GetAllProductsService {
  static Future<List<ProductModel>> getAllProducts() async {
    final url = "https://fakestoreapi.com/products";

    http.Response response = await http.get(Uri.parse(url));
    List<ProductModel> productsList = [];

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      productsList = data.map((e) => ProductModel.fromJson(e)).toList();
    }
    return productsList;
  }
}
