import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/screens/filters_screens.dart';
import 'package:meal_app/screens/tabs_screens.dart';
import 'package:meal_app/widgets/meals_widgets.dart';

import 'dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp_state();
  }

}

class MyApp_state extends State<MyApp> {

  Map<String, bool> filtersvalues = {
    'GlutenFree': false,
    'Vegan': false,
    'Vegetarian': false,
    'LactoseFree': false,
  };
  List<Meal>AVAILABLEMEALS= DUMMY_MEALS;
void get_filtersvalues( Map<String, bool> filtersval){
    setState((){
      filtersvalues=filtersval;
      AVAILABLEMEALS=DUMMY_MEALS.where((meal){
        if(!meal.isGlutenFree&& filtersvalues['GlutenFree']==true) {
          return false;
        }
        if(!meal.isLactoseFree&& filtersvalues['LactoseFree']==true)
          return false;
        if(!meal.isVegetarian&& filtersvalues['Vegetarian']==true)
          return false;
        if(!meal.isVegan&& filtersvalues['Vegan']==true)
          return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal,
        accentColor: Colors.greenAccent,
        canvasColor: Color.fromRGBO(253, 245, 230, 1),
        textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotCondensed',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => TABS_SCREEN(),
        FILTERS_SCREEN.routename: (context) => FILTERS_SCREEN(get_filtersvalues,filtersvalues),
        FAVIRITE_SCREEN.routename: (context) => FAVIRITE_SCREEN(),
        CATEGORY_SCREEN.routename: (context) => CATEGORY_SCREEN(),
        CATEGORYMEALSSCREEN.routename: (context) => CATEGORYMEALSSCREEN(AVAILABLEMEALS),
        MEALS_WIDGET.routename: (context) => MEALS_WIDGET(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
