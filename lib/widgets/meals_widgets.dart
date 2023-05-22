import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../screens/category_meals_screen.dart';
import 'meals_list_widget.dart';

class MEALS_WIDGET extends StatelessWidget {
  static const routename = 'MEALS_WIDGET';

  @override
  Widget build(BuildContext context) {
    final meal =
    ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, String>;
    final String mealid = meal['id'].toString();
    final mealdata = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
        appBar: AppBar(
          title: Text('${mealdata.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                child: Column(
                  children: [
                    InteractiveViewer(
                      child: Image.network(
                        '${mealdata.imageUrl}', fit: BoxFit.fill,),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Ingredient",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height:5),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border:Border.all(color:Color(0xffb2dfdb),width:3,),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 200,
                      width: 400,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: ListView.builder(
                          itemCount: mealdata.ingredients.length,
                          itemBuilder: (ctx1, index1) {
                            return Card(
                              child: Text(
                                '- ${mealdata.ingredients[index1]}',
                                style: TextStyle(fontSize: 20),
                              ),
                              margin: EdgeInsets.all(5),
                              color: Colors.teal[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          }
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Duration      ${mealdata.duration.toString()}",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Steps",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        border:Border.all(color:Color(0xffb2dfdb),width:3,),
                          borderRadius: BorderRadius.circular(30),
                      ),
                      width: 400,
                      height: 300,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: ListView.builder(
                          itemCount: mealdata.steps.length,
                          itemBuilder: (ctx2, index2) {
                            return Card(
                                child: Text(
                                  '${index2 + 1}- ${mealdata.steps[index2]}',
                                  style: TextStyle(fontSize: 20),
                                ),
                                margin: EdgeInsets.all(5),
                                color:Colors.teal[100],
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),)
                            ,
                            );
                          }
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(color: Colors.black)
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){removemeal(context,mealid);},
          child:Icon(Icons.delete),),
    );
  }
  void removemeal(BuildContext ctx,String mealid ){
    Navigator.of(ctx).pop(mealid);
    }
}
