import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/bloc/cart_bloc.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/product_list_item_model.dart';

class AddToCart extends StatelessWidget {
  final ProductListItemModel item;

  AddToCart({@required this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    var cartItem = new CartItemModel(
      id: item.id,
      price: item.price,
      image: item.image,
      quantity: 1,
      title: item.title,
    );

    if (!bloc.itemInCart(cartItem)) {
      return Container(
        width: 80,
        height: 40,
        child: TextButton(
          child: Icon(Icons.add_shopping_cart),
          onPressed: () {
            bloc.addItem(
              cartItem,
            );
            final snackBar =
                SnackBar(content: Text('${item.title} adicionado'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      );
    } else {
      return Container(
        width: 80,
        height: 40,
        child: TextButton(
          child: Icon(Icons.remove_shopping_cart),
          onPressed: () {
            bloc.removeItem(
              cartItem,
            );
            final snackBar = SnackBar(content: Text('${item.title} removido'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }
  }
}
