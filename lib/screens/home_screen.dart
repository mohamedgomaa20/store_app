import 'package:flutter/material.dart';
import 'package:store_app/services/get_all_categories_service.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/services/get_category_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // GetAllProductsService.getAllProducts();
          // GetAllCategoriesService.getAllCategories();
          GetCategoryService.getCategory("jewelery");
        },
      ),
    );
  }
}
