import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/models/product_list_item_model.dart';
import 'package:shopping_app/ui/android/pages/product_page.dart';
import 'package:shopping_app/ui/shared/widgets/shared/add_to_cart.dart';

class ProductIcon extends StatelessWidget {
  final ProductListItemModel item;

  ProductIcon({@required this.item});

  @override
  Widget build(BuildContext context) {
    final price = NumberFormat("#,##0.00", "pt_BR");

    return Container(
      margin: EdgeInsets.all(5),
      width: 240,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.03),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(tag: item.tag)));
            },
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(5),
                    bottom: Radius.circular(5),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(item.image),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            child: Text(
              item.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              item.brand,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120,
                  child: Text(
                    "R\$ ${price.format(item.price)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                AddToCart(
                  item: item,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
