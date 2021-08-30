import 'package:flutter/material.dart';
import 'package:meals_app/list/dummy_data.dart';
import 'package:meals_app/widget/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: deprecated_member_use
        title: Text('DeliMeals',style: Theme.of(context).textTheme.title,),
      ),
      body: Center(
        child: GridView(
          padding: const EdgeInsets.all(5),
          children: [
            ...DUMMY_CATEGORIES.map((e) => CategoryItem(title: e.title, color: e.color,id: e.id,)).toList()
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
        ),
      ),
    );
  }
}
