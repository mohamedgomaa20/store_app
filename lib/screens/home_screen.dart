import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/services/update_product_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ProductModel productModel = await UpdateProductService.updateProduct(
            id: "1",
            title: "777777777777777777777777777",
            price: 120,
            description: "777777777777777777777777777777777",
            category: "men's clothing",
            image: "https://fakestoreapi.com",
          );
          print("productModel: ${productModel.title}");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
