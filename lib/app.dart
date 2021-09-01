import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screen/category_meals_screen.dart';
import 'package:meals_app/screen/filters_screen.dart';
import 'package:meals_app/screen/meals_detail_screen.dart';
import 'package:meals_app/screen/tapcontroll_page.dart';

import 'models/meals.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: unused_field
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  // ignore: unused_field

  List<Meal> _availableMeals = DUMMY_MEALS;
  // ignore: unused_field
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
    });

    _availableMeals = DUMMY_MEALS.where((element) {
      if (_filters['gluten']! && !element.isGlutenFree) {
        return false;
      }
      if (_filters['lactose']! && !element.isLactoseFree) {
        return false;
      }
      if (_filters['vegan']! && !element.isVegan) {
        return false;
      }
      if (_filters['vegetarian']! && !element.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  // ignore: unused_element
  void _toggleFavorite(String mealID) {
    // ignore: unused_local_variable
    final exitingIndex = _favoriteMeals
        // ignore: unrelated_type_equality_checks
        .indexWhere((element) => element.id == mealID);
    if (exitingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(exitingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    }
  }

  bool _checkFavorite(String mealID) {
    return _favoriteMeals.any((element) => element.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.blue,
          canvasColor: Color.fromRGBO(220, 255, 255, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              body1: TextStyle(color: Color.fromRGBO(50, 20, 55, 1)),
              // ignore: deprecated_member_use
              body2: TextStyle(color: Color.fromRGBO(50, 20, 55, 1)),
              // ignore: deprecated_member_use
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TapControllPape(favoriteMeals: _favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealsDetailScreen.routeName: (ctx) => MealsDetailScreen(
              toggleFavorite: _toggleFavorite,
              checkFavorite: _checkFavorite,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              setFilters: _setFilters,
              filters: _filters,
            ),
      },
      // onGenerateRoute: (settings) {},
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) =>
                CategoryMealsScreen(availableMeals: _availableMeals));
      },
    );
  }
}
