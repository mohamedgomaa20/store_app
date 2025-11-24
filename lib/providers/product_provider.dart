import 'package:flutter/cupertino.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_categories_service.dart';
import 'package:store_app/services/get_all_product_service.dart';

import '../services/get_products_by_category_service.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> allProducts = [];
  List<ProductModel> filteredProducts = [];
  bool isLoading = false;
  bool isLoadingCategories = false;
  String? error;
  String? errorCategory;
  List<String> categoriesList = ["all"];
  String selectedCategory = "all";
  int selectedIndex = 0;

  ProductProvider() {
    getAllProducts();
    getAllCategories();
  }

  Future<void> getAllProducts() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      allProducts = await GetAllProductsService.getAllProducts();
      isLoading = false;
      error = null;
      notifyListeners();
    } catch (e) {
      error = 'Failed to load products: ${e.toString()}';
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getAllCategories() async {
    isLoadingCategories = true;
    errorCategory = null;
    notifyListeners();
    try {
      var list = await GetAllCategoriesService.getAllCategories();
      categoriesList.addAll(list.map((e) => e.toString()).toList());
      isLoadingCategories = false;
      errorCategory = null;
      notifyListeners();
    } catch (e) {
      errorCategory = 'Failed to load categories: ${e.toString()}';
      isLoadingCategories = false;
      notifyListeners();
    }
  }

  Future<void> getProductsByCategory(String categoryName) async {
    selectedCategory = categoryName;
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      if (categoryName == "all") {
        filteredProducts = allProducts;
      } else {
        filteredProducts =
            await GetProductsByCategoryService.getProductsByCategory(
              categoryName,
            );
      }
      isLoading = false;
      error = null;
      notifyListeners();
    } catch (e) {
      error = 'Failed to load products: ${e.toString()}';
      isLoading = false;
      notifyListeners();
    }
  }

  void changeCategoryIndex(int index) {
    selectedCategory = categoriesList[index];
    selectedIndex = index;
    notifyListeners();
  }
}
