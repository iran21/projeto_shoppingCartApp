import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/bloc/home_page_bloc.dart';
import 'package:shopping_app/models/category_model.dart';

import '../../../../settings.dart';

class CategoryIcon extends StatelessWidget {
  final CategoryModel item;
  CategoryIcon({@required this.item});
  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = Provider.of<HomeBloc>(context);
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: item.tag == bloc.selectedCategory ? Colors.blue : Colors.yellow,
        borderRadius: BorderRadius.all(
          Radius.circular(70),
        ),
      ),
      child: TextButton(
          onPressed: () {
            bloc.changeCategory(item.tag);
          },
          child: Image.asset(
              "assets/categories/${Settings.theme}/${item.tag}.png")),
    );
  }
}
