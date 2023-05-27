import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/model/category.dart';
import 'package:shopping_list/model/grocory_item.dart';

class GrocoriesListItem extends StatelessWidget {
  const GrocoriesListItem({super.key, required this.grocoriesModel});

  final GroceryItem grocoriesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      // decoration: BoxDecoration(color: grocoriesModel.color),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Container(
            width: 20,
            height: 20,
            color: categories[
                    parseCategory(grocoriesModel.category.title.toLowerCase())]!
                .color,
          ),
          const SizedBox(
            width: 32,
          ),
          Text(
            grocoriesModel.name,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontSize: 18),
          ),
          const Spacer(),
          Text('${grocoriesModel.quantity}'),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
