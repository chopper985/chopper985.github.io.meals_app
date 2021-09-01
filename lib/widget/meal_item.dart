import 'package:flutter/material.dart';

import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screen/meals_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String urlImage;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function handle;
  const MealItem({
    Key? key,
    required this.title,
    required this.urlImage,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.id,
    // required this.handle
  }) : super(key: key);

  String get selectComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Error';
    }
  }

  String get selectAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Error';
    }
  }

  void selectMeals(BuildContext context) {
    Navigator.of(context).pushNamed(MealsDetailScreen.routeName, arguments: id)
        // .then((value) => handle(value))
        ;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeals(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/circle.gif',
                    image: urlImage,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      width: 300,
                      color: Colors.black45,
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 26),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$duration min',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        selectComplexity,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        selectAffordability,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
