import 'package:flutter/material.dart';
import 'package:meals_app/widget/drawer_main.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String,bool> filters;
  const FiltersScreen({Key? key, required this.setFilters,required this.filters}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? isGlutenFree = false;
  bool? isLactoseFree = false;
  bool? isVegan = false;
  bool? isVegetarian = false;

  

  // ignore: unused_element
  Widget _buildSwitchListTile(bool isFree, String title, Function(bool)? handle) {
    return SwitchListTile(
        value: isFree,
        title: Text(title),
        subtitle: Text('Only include ' + title + ' meals'),
        onChanged: handle);
  }
  @override
  void initState() {
    isGlutenFree = widget.filters['gluten'];
    isLactoseFree = widget.filters['lactose'];
    isVegan = widget.filters['vegan'];
    isVegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegan': isVegan,
                  'vegetarian': isVegetarian,
                };
                widget.setFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
        title: Text(
          'Your Filters',
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ),
      ),
      drawer: DrawerMain(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(25),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          _buildSwitchListTile(isGlutenFree!, 'Gluten-free', (newValue) {
            setState(() {
              isGlutenFree = newValue;
            });
          }),
          _buildSwitchListTile(isLactoseFree!, 'isLactoseFree', (newValue) {
            setState(() {
              isLactoseFree = newValue;
            });
          }),
          _buildSwitchListTile(isVegan!, 'isVegan', (newValue) {
            setState(() {
              isVegan = newValue;
            });
          }),
          _buildSwitchListTile(isVegetarian!, 'isVegetarian', (newValue) {
            setState(() {
              isVegetarian = newValue;
            });
          }),
        ],
      ),
    );
  }
}
