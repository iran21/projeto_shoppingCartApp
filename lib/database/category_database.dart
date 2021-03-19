import 'package:dio/dio.dart';
import 'package:shopping_app/models/category_model.dart';

import '../settings.dart';

class CategoryDatabase {
  Future<List<CategoryModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/categories";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((element) => CategoryModel.fromJson(element))
        .toList();
  }
}
