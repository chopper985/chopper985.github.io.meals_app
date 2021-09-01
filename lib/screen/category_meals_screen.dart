import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  late List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    // ignore: unused_local_variable
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryID = routeArgs['id'];
    // ignore: unused_local_variable
    categoryMeals = widget.availableMeals.where((element) {
      return element.categories.contains(categoryID);
    }).toList();

    super.didChangeDependencies();
  }

  // ignore: unused_element
  void _handle(String mealid) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              urlImage: categoryMeals[index].UrlImage,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              // handle: _handle
              );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
