import 'package:flutter/widgets.dart';
import 'package:shopping_app/models/product_list_item_model.dart';
import 'package:shopping_app/ui/shared/widgets/shared/loader.dart';
import 'package:shopping_app/ui/shared/widgets/product/product_icon.dart';

class ProductList extends StatelessWidget {
  final List<ProductListItemModel> products;

  const ProductList({this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: Loader(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: ProductIcon(item: products[index]),
        );
      },
    );
  }
}
