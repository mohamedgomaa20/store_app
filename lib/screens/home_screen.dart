import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_categories_service.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/services/get_category_service.dart';
import 'package:http/http.dart' as http;

import '../helper/api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // GetAllProductsService.getAllProducts();
          // GetAllCategoriesService.getAllCategories();
          // GetCategoryService.getCategory("jewelery");
          await Api.post(
            url: "https://fakestoreapi.com/products",
            body: {
              "title": "mmm",
              "price": "100",
              "description": "mmm",
              "image": "https://fakestoreapi.com",
              "category": "men's clothing",
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
