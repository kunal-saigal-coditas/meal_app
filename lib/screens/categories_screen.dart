import 'package:flutter/material.dart';
import '../widgets/catergory_item.dart';
import '../dummy_data (1).dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.title, catData.color, catData.id),
          )
          .toList(),
    );
  }
}
