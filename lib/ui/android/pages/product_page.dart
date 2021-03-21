import 'package:flutter/material.dart';
import 'package:shopping_app/database/product_database.dart';
import 'package:shopping_app/models/product_details_model.dart';
import 'package:shopping_app/ui/shared/widgets/shared/progress_indicator.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final _productDb = ProductDatabase();

  ProductPage({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      future: _productDb.get(tag),
      builder: (context, snapshot) {
        ProductDetailsModel product = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Container(
              color: Colors.white,
              child: Center(
                child: GenericProgressIndicator(),
              ),
            );
            break;
          case ConnectionState.none:
            return Text('Aguardando...');
            break;
          case (ConnectionState.done):
            if (snapshot.hasError)
              return Center(
                child: Text(snapshot.error),
              );
            return content(product);
            break;
          default:
            return null;
        }
      },
    );
  }

  Widget content(ProductDetailsModel product) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            child: Image.network(product.images[index]),
          );
        },
      ),
    );
  }
}
