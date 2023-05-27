import 'package:flutter/material.dart';
import 'package:shopping_list/screen/NewItemScreen.dart';

import '../model/grocory_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final availableGrocories = groceryItems;

  final List<GroceryItem> _grocoriesItemList = [];

  void _onClickAdd() async {
    final groceryItem = await Navigator.push<GroceryItem>(context,
        MaterialPageRoute(builder: (context) {
      return NewItemScrenn();
    }));

    if (groceryItem == null) {
      return;
    }
    setState(() {
      _grocoriesItemList.add(groceryItem!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Yo have no grocories item, try adding one",
          style: TextStyle(
              fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );

    if (_grocoriesItemList.isNotEmpty) {
      mainContent = ListView.builder(
          itemCount: _grocoriesItemList.length,
          itemBuilder: (ctx, index) {
            return Dismissible(
              background: Container(color: Colors.red),
              key: ValueKey(_grocoriesItemList[index].id),
              onDismissed: (direction) {
                setState(() {
                  _grocoriesItemList.remove(_grocoriesItemList[index]);
                });
              },
              child: ListTile(
                onTap: () {},
                leading: Container(
                  width: 20,
                  height: 20,
                  color: _grocoriesItemList[index].category.color,
                ),
                title: Text(_grocoriesItemList[index].name),
                trailing: Text('${_grocoriesItemList[index].quantity}'),
              ),
            );
            //  GrocoriesListItem(grocoriesModel: availableGrocories[index]);
          });
    }
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.second,
        title: const Text('Flutter grocories'),
        actions: [
          IconButton(
              onPressed: () {
                _onClickAdd();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: mainContent,
    );
  }
}
