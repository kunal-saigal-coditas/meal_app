import 'package:flutter/material.dart';
import '../widgets/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListTile({String title, IconData icon, Function tapHandler}) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(18),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
              title: 'Meals',
              icon: Icons.restaurant,
              tapHandler: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          buildListTile(
              title: 'Filters',
              icon: Icons.settings,
              tapHandler: () {
                Navigator.of(context)
                    .pushReplacementNamed(FilteresScreen.routeName);
              }),
        ],
      ),
    );
  }
}
