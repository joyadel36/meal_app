import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meals_list_widget.dart';
class CATEGORYMEALSSCREEN extends StatefulWidget {
  static const routename = 'CATEGORYMEALSSCREEN';
final List<Meal>_AVAILABLEMEAL;
  CATEGORYMEALSSCREEN(this._AVAILABLEMEAL);
  @override
  State<StatefulWidget> createState() {
    return _CATEGORYMEALSSCREENSTATE();
  }
}

class _CATEGORYMEALSSCREENSTATE extends State<CATEGORYMEALSSCREEN> {
  late List<Meal> categorymeals;
  late String categorytitle;
  @override
  void didChangeDependencies () {
    final categorydata =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryid = categorydata['id'];
    categorytitle = categorydata['title'].toString();
    categorymeals = widget._AVAILABLEMEAL.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }
  void removeitem(String idmeal) {
    setState(() {
      categorymeals.removeWhere((meal) => meal.id == idmeal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$categorytitle"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MEALS_LIST_WIDGET(
            categorymeals[index].id,
            categorymeals[index].title,
            categorymeals[index].steps,
            categorymeals[index].ingredients,
            categorymeals[index].imageUrl,
            categorymeals[index].affordability,
            categorymeals[index].complexity,
            categorymeals[index].duration,
            removeitem,
          );
        },
        itemCount: categorymeals.length,
      ),
    );
  }
}
