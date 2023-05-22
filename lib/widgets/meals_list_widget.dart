import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import '../models/meal.dart';
import 'meals_widgets.dart';

class MEALS_LIST_WIDGET extends StatelessWidget {
  static const routename = 'MEALS_LIST_WIDGET';
  final String id;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final Function func;

  MEALS_LIST_WIDGET(
      this.id,
      this.title,
      this.steps,
      this.ingredients,
      this.imageUrl,
      this.affordability,
      this.complexity,
      this.duration,
      this.func);
  void selectmeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MEALS_WIDGET.routename, arguments: {'id': id}).then((result) {
      if (result != null) func(result);
    });
  }

  String get complex {
    if (complexity == Complexity.Simple)
      return 'simple';
    else if (complexity == Complexity.Hard)
      return 'Hard';
    else if (complexity == Complexity.Challenging)
      return 'Challenging';
    else
      return '';
  }

  String get Affordable {
    if (affordability == Affordability.Affordable)
      return 'Affordable';
    else if (affordability == Affordability.Luxurious)
      return 'Luxurious';
    else if (affordability == Affordability.Pricey)
      return 'Pricey';
    else
      return '';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectmeal(context),
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    width: 250,
                    child: Text(title,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.left),
                  ),
                ),
              ],
            ),
            Container(
              height: 80,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.access_time),
                  Text("${duration.toString()}"),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.work),
                  Text("${complex}"),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.attach_money),
                  Text("${Affordable}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
