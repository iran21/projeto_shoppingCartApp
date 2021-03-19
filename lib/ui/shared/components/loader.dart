import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/ui/shared/components/progress_indicator.dart';

class Loader extends StatelessWidget {
  final List object;
  final Function callback;

  Loader({@required this.object, @required this.callback});

  @override
  Widget build(BuildContext context) {
    if (object == null) {
      return Center(
        child: GenericProgressIndicator(),
      );
    }
    if (object.length == 0) {
      return Center(
        child: Text('Nenhum item encontrado =('),
      );
    }
    return callback();
  }
}
