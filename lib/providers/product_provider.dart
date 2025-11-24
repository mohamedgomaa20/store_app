import 'package:flutter/cupertino.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_categories_service.dart';
import 'package:store_app/services/get_all_product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> allProducts = [];
  bool isLoading = false;
  bool isLoadingCategories = false;
  String? error;
  String? errorCategory;
  List<String> categoriesList = [];

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
      categoriesList = await GetAllCategoriesService.getAllCategories();
      isLoadingCategories = false;
      errorCategory = null;
      notifyListeners();
    } catch (e) {
      errorCategory = 'Failed to load categories: ${e.toString()}';
      isLoadingCategories = false;
      notifyListeners();
    }
  }
}
