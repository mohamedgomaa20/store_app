import 'package:store_app/helper/api.dart';
import 'package:store_app/models/cart_model.dart';

class GetCartByIdService {
  static Future<CartModel> getCartById(int cartId) async {
    var data = await Api.get(url: "https://fakestoreapi.com/carts/$cartId");
    CartModel cartModel = CartModel.fromJson(data);

    return cartModel;
  }
}
