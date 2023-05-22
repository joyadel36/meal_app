import 'package:flutter/material.dart';

import '../screens/filters_screens.dart';

class DRAWER_WIDGET extends StatelessWidget {
  ListTile buildlisttile(String title, Icon icon, Function func) {
    return ListTile(
      title: Text(
        '$title ',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Raleway'),
      ),
      leading: icon,
      onTap: () => func(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          children: [
            Container(
              alignment:Alignment.centerLeft ,
              height: 150,
              width: double.infinity,
              color: Colors.teal[300],
              padding: EdgeInsets.all(15),
              child: Text(
                "Cooking Up !",
                style: TextStyle(
                  color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: 'Raleway'),
              ),
            ),
            SizedBox(height: 20,),
            buildlisttile('Meal', Icon(Icons.restaurant,size: 50,), () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            SizedBox(height: 20,),
            buildlisttile('Filters', Icon(Icons.filter_alt,size: 50,), () {
              Navigator.of(context).pushReplacementNamed(FILTERS_SCREEN.routename);
            }),
          ],
        ),

    );
  }
}
