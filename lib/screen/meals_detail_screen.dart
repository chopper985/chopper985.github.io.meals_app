import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealsDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function checkFavorite;
  const MealsDetailScreen(
      {Key? key, required this.toggleFavorite, required this.checkFavorite})
      : super(key: key);

  @override
  _MealsDetailScreenState createState() => _MealsDetailScreenState();
}

class _MealsDetailScreenState extends State<MealsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final mealID = ModalRoute.of(context)!.settings.arguments as String;

    Widget widgetTitle(String text, BuildContext context) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        child: Text(
          text,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget widgetInfo(Widget child) {
      return Container(
        height: 180,
        width: 350,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      );
    }

    // ignore: unused_local_variable
    final mealsdetail =
        DUMMY_MEALS.firstWhere((element) => element.id == mealID);
    return Scaffold(
      // ignore: deprecated_member_use
      appBar: AppBar(
        title: Text(mealsdetail.title
            // ignore: deprecated_member_use
            ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/circle.gif',
                image: mealsdetail.UrlImage,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            // ignore: deprecated_member_use
            widgetTitle('Ingredients', context),
            widgetInfo(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        mealsdetail.ingredients[index],
                        style: TextStyle(fontSize: 15),
                      ),
                    )),
                itemCount: mealsdetail.ingredients.length,
              ),
            ),
            widgetTitle('Steps', context),
            widgetInfo(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                        leading: CircleAvatar(
                          child: Text('$index'),
                        ),
                        title: Text(mealsdetail.steps[index])),
                    Divider()
                  ],
                ),
                itemCount: mealsdetail.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.toggleFavorite(mealID),
        child: Icon(Icons.favorite,
            color: widget.checkFavorite(mealID) ? Colors.red : Colors.black),
      ),
    );
  }
}
