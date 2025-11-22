import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';

class GetCategoryService {
  static Future<List<dynamic>> getCategory(String categoryName) async {
    List<dynamic> data = await Api.get(
      url: "https://fakestoreapi.com/products/category/$categoryName",
    );
    // List<ProductModel> productsList = [];
    // productsList = data.map((e) => ProductModel.fromJson(e)).toList();
    return data;
  }
}
