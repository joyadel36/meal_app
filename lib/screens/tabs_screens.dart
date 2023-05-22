import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';
import 'category_screen.dart';
import 'favorite_screen.dart';

class TABS_SCREEN extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TABS_SCREEN_State();
  }
}

class TABS_SCREEN_State extends State<TABS_SCREEN> {
  final List<Map<String, Object>> _selectedpage = [
    {
      'page': CATEGORY_SCREEN(),
      'title': Text("Categories"),
    },
    {
      'page': FAVIRITE_SCREEN(),
      'title': Text("Favorites"),
    },
  ];
  int _selectindex = 0;

  void selecttab(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: _selectedpage[_selectindex]['title'] as Text,
        ),
        body: _selectedpage[_selectindex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          currentIndex: _selectindex,
          onTap: selecttab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorites",
            ),
          ],
        ),
        drawer: DRAWER_WIDGET(),
      ),
    );
  }
}
