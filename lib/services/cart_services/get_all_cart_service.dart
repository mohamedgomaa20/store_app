import 'package:store_app/models/cart_model.dart';

import '../../helper/api.dart';

class GetAllCartService {
  static Future<List<CartModel>> getAllCart() async {
    List<dynamic> data = await Api.get(
      url: "https://fakestoreapi.com/carts",
    );
    print(data);
    List<CartModel> cartList = [];
    cartList = data.map((e) => CartModel.fromJson(e)).toList();
    print("=====================>");
    print(cartList);
    print("=====================>");
    return cartList;
  }
}
