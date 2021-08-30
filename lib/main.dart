import 'package:flutter/material.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
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
      home: CategoriesScreen(),
      routes: {
        '/category-meals': (ctx) => CategoryMealsScreen(),
      },
    );
  }
}
