import 'package:store_app/helper/api.dart';

class DeleteCartService {
  static Future<bool> deleteCart(int cartId) async {
    var data = await Api.delete(url: "https://fakestoreapi.com/carts/$cartId");
    return true;
  }
}
