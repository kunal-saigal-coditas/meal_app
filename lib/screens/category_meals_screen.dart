import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../dummy_data (1).dart';

class CategoryMealScreen extends StatelessWidget {
  static const routename = '/category-meals';
  // CategoryMealScreen(
  //     {@required this.catergoryId, @required this.catergoryTitle});

  // final String catergoryId;
  // final String catergoryTitle;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
