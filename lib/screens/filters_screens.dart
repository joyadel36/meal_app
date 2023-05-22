import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

class FILTERS_SCREEN extends StatefulWidget {
  static const routename = 'FILTERS_SCREEN';
  final Function;
  final Map<String, bool> filtersvalus;

  FILTERS_SCREEN(this.Function, this.filtersvalus);

  @override
  State<StatefulWidget> createState() {
    return FILTERS_SCREEN_STATE();
  }
}

class FILTERS_SCREEN_STATE extends State<FILTERS_SCREEN> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;
  /*Map<String, bool> filtersval = {
    'GlutenFree': false,
    'Vegan': false,
    'Vegetarian': false,
    'LactoseFree': false,
  };*/

  @override
  initState() {
    setState(() {
      isGlutenFree = (widget.filtersvalus['GlutenFree'])!;
      isVegan = (widget.filtersvalus['Vegan'])!;
      isVegetarian = (widget.filtersvalus['Vegetarian'])!;
      isLactoseFree = (widget.filtersvalus['LactoseFree'])!;
    });
    super.initState();
  }

  SwitchListTile buildswitchlisttile(
      String title, String subtitle, bool currentval, Function onchangefunc) {
    return SwitchListTile(
      title: Text("$title"),
      subtitle: Text("$subtitle"),
      value: currentval,
      activeColor: Colors.teal[300],
      inactiveThumbColor: Colors.grey,
      onChanged: (newvalue) {
        onchangefunc(newvalue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  widget.filtersvalus['GlutenFree'] = isGlutenFree;
                  widget.filtersvalus['Vegetarian'] = isVegetarian;
                  widget.filtersvalus['Vegan'] = isVegan;
                  widget.filtersvalus['LactoseFree'] = isLactoseFree;
                });
                widget.Function(widget.filtersvalus);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "Adjust your meals selection",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                buildswitchlisttile(
                    'GlutenFree', 'Only Include GlutenFree Meals', isGlutenFree,
                    (bool value) {
                  setState(() {
                    isGlutenFree = value;
                  });
                }),
                SizedBox(
                  height: 10,
                ),
                buildswitchlisttile(
                    'LactoseFree',
                    'Only Include LactoseFree Meals',
                    isLactoseFree, (bool value) {
                  setState(() {
                    isLactoseFree = value;
                  });
                }),
                SizedBox(
                  height: 10,
                ),
                buildswitchlisttile(
                    'Vegan', 'Only Include Vegan Meals', isVegan, (bool value) {
                  setState(() {
                    isVegan = value;
                  });
                }),
                SizedBox(
                  height: 10,
                ),
                buildswitchlisttile(
                    'Vegetarian', 'Only Include Vegetarian Meals', isVegetarian,
                    (bool value) {
                  setState(() {
                    isVegetarian = value;
                  });
                }),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: DRAWER_WIDGET(),
    );
  }
}
