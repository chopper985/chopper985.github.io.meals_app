import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/favorite_screen.dart';
import 'package:meals_app/widget/drawer_main.dart';

class TapControllPape extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TapControllPape({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  _TapControllPapeState createState() => _TapControllPapeState();
}

class _TapControllPapeState extends State<TapControllPape> {
  List<Map<String, dynamic>>? _pages;

  int _selectPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(favoriteMeals: widget.favoriteMeals),
        'title': 'Favorites'
      }
    ];
    super.initState();
  }

  // ignore: unused_element
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages![_selectPageIndex]['title'],
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ),
      ),
      drawer: DrawerMain(),
      body: _pages![_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5,
        selectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.category,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorite'),
        ],
      ),
    );
    // ignore: deprecated_member_use
    //   return DefaultTabController(
    //       length: 2,
    //       child:
    //           bottom: TabBar(
    //             unselectedLabelStyle:
    //                 TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    //             labelColor: Colors.black,
    //             labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    //             indicatorColor: Colors.pink.shade200,
    //             indicatorSize: TabBarIndicatorSize.tab,
    //             indicatorWeight: 3,
    //             tabs: [
    //               // ignore: deprecated_member_use
    //               Tab(
    //                   icon: Icon(
    //                     Icons.category,
    //                     color: Colors.blue,
    //                   ),
    //                   text: 'Categories'),
    //               Tab(
    //                   icon: Icon(
    //                     Icons.favorite,
    //                     color: Colors.red,
    //                   ),
    //                   text: 'Favorite')
    //             ],
    //           ),
    //         ),
    //         body: TabBarView(
    //           children: [CategoriesScreen(), FavoriteScreen()],
    //         ),
    //       ));
  }
}
