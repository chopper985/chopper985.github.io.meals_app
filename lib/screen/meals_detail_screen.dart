import 'package:flutter/material.dart';

class MealsDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealsDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final mealID = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      // ignore: deprecated_member_use
      appBar: AppBar(
        title: Text(
          'Detail',
          // ignore: deprecated_member_use
        ),
      ),
      body: Center(
        child: Text('Meals Detail'),
      ),
    );
  }
}
