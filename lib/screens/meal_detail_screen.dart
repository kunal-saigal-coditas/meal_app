import 'package:flutter/material.dart';
import '../dummy_data (1).dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget buildSectionTable(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Ingrediants",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget buildContainer({Widget child}) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: double.infinity,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text("${selectedMeals.title}")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeals.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTable(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeals.ingredients[index])),
                ),
                itemCount: selectedMeals.ingredients.length,
              ),
            ),
            buildSectionTable(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: ((ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(selectedMeals.steps[index]),
                        ),
                        Divider(),
                      ],
                    )),
                itemCount: selectedMeals.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
