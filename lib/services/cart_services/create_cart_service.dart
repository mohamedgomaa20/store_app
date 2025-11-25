import 'package:store_app/helper/api.dart';
import 'package:store_app/models/cart_model.dart';

class CreateCartService {
  static Future<CartModel> createCart({
    required int userId,
    required List<CartProduct> products,
  }) async {
    var data = await Api.post(
      url: "https://fakestoreapi.com/carts",
      body: {"userId": 1, "products": products.map((e) => e.toJson()).toList()},
    );
    CartModel cartModel = CartModel.fromJson(data);
    return cartModel;
  }
}
