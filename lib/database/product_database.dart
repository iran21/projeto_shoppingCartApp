import 'package:dio/dio.dart';
import 'package:shopping_app/models/category_model.dart';
import 'package:shopping_app/models/product_details_model.dart';
import 'package:shopping_app/models/product_list_item_model.dart';

import '../settings.dart';

class ProductDatabase {
  Future<List<ProductListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((element) => ProductListItemModel.fromJson(element))
        .toList();
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async {
    var url = "${Settings.apiUrl}v1/categories/$category/products";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((element) => ProductListItemModel.fromJson(element))
        .toList();
  }

  Future<ProductDetailsModel> get(String tag) async {
    var url = "${Settings.apiUrl}v1/products/$tag";
    Response response = await Dio().get(url);
    return ProductDetailsModel.fromJson(response.data);
  }
}
