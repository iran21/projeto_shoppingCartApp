import 'package:flutter/widgets.dart';
import 'package:shopping_app/models/cart_model.dart';

class CartBloc extends ChangeNotifier {
  List<CartItemModel> cart = [];
  double total = 0;

  get() {
    return cart;
  }

  addItem(CartItemModel item) {
    cart.add(item);
    calculateTotal();
  }

  removeItem(CartItemModel item) {
    cart.removeWhere((element) => element.id == item.id);
    calculateTotal();
  }

  itemInCart(CartItemModel item) {
    bool result = false;
    cart.forEach((element) {
      if (element.id == item.id) {
        result = true;
      }
    });
    return result;
  }

  increaseItem(CartItemModel item) {
    if (item.quantity < 10) {
      item.quantity++;
      calculateTotal();
    }
  }

  decraseItem(CartItemModel item) {
    if (item.quantity > 1) {
      item.quantity--;
    }
  }

  calculateTotal() {
    total = 0;
    cart.forEach((element) {
      total = (element.price * element.quantity);
    });
    notifyListeners();
  }
}
