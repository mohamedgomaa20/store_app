import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class GetCategoryService {
  static Future<List<ProductModel>> getCategory(String categoryName) async {
    final url = "https://fakestoreapi.com/products/category/$categoryName";
    http.Response response = await http.get(Uri.parse(url),);
    List<ProductModel> productsList = [];
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      productsList = data.map((e) => ProductModel.fromJson(e)).toList();
    }
    print(productsList);
    return productsList;
  }
}
