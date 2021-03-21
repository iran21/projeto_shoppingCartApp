import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/bloc/home_page_bloc.dart';
import 'package:shopping_app/ui/shared/widgets/category/category_list.dart';
import 'package:shopping_app/ui/shared/widgets/product/product_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = Provider.of<HomeBloc>(context);
    print(bloc.categories);
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 60,
          ),
          Text(
            'Categorias',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CategoryList(categories: bloc.categories),
          SizedBox(
            height: 20,
          ),
          Text(
            'Mais vendidos',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 10,
          ),
          ProductList(
            products: bloc.products,
          )
        ],
      ),
    );
  }
}
