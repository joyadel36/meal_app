import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_widget.dart';

class CATEGORY_SCREEN extends StatelessWidget {
  static const routename= 'CATEGORY_SCREEN';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
          children: DUMMY_CATEGORIES.map((categorytdata) {
            return CATEGORY_WIDGET(
                categorytdata.id, categorytdata.title, categorytdata.color);
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
        ));
  }
}
