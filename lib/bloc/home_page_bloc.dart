import 'package:flutter/cupertino.dart';
import 'package:shopping_app/database/category_database.dart';
import 'package:shopping_app/database/product_database.dart';
import 'package:shopping_app/models/category_model.dart';
import 'package:shopping_app/models/product_list_item_model.dart';

class HomeBloc extends ChangeNotifier {
  final categoryDatabase = CategoryDatabase();
  final productDatabase = ProductDatabase();

  List<ProductListItemModel> products;
  List<CategoryModel> categories;
  String selectedCategory = 'todos';

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryDatabase.getAll().then((data) {
      this.categories = data;
      notifyListeners();
    });
  }

  getProducts() {
    productDatabase.getAll().then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  getProductsByCategory() {
    productDatabase.getByCategory(selectedCategory).then((data) {
      this.products = data;
      notifyListeners();
    });
  }

  changeCategory(String tag) {
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
    notifyListeners();
  }
}
