import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilteresScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FilteresScreen> createState() => _FilteresScreenState();
}

class _FilteresScreenState extends State<FilteresScreen> {
  bool _glutenFree = false;
  bool _vegitarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-Free',
                    'Only include Gluten-Free meals',
                    _glutenFree,
                    (newValue) {
                      setState(
                        () {
                          _glutenFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose-Free',
                    'Only include Lactose-Free meals',
                    _lactoseFree,
                    (newValue) {
                      setState(
                        () {
                          _lactoseFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'Only include Vegetarian meals',
                    _vegitarian,
                    (newValue) {
                      setState(
                        () {
                          _vegitarian = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only include Vegan meals',
                    _vegan,
                    (newValue) {
                      setState(
                        () {
                          _vegan = newValue;
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
