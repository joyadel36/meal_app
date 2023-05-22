import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CATEGORY_WIDGET extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CATEGORY_WIDGET(this.id, this.title, this.color);
  void selsectcategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CATEGORYMEALSSCREEN.routename, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selsectcategory(context);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, Color.fromRGBO(255, 229, 204, 0.5)],
          ),
        ),
        child: Center(
          child: Text("$title", style: Theme.of(context).textTheme.subtitle1),
        ),
      ),
    );
  }
}
