import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/model/category.dart';
import 'package:shopping_list/model/grocory_item.dart';

class NewItemScrenn extends StatefulWidget {
  const NewItemScrenn({super.key});

  @override
  State<NewItemScrenn> createState() => _NewItemScrennState();
}

class _NewItemScrennState extends State<NewItemScrenn> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = "";
  var _enteredQuantity = 1;
  var _enteredCategory = categories[Categories.vegetables];

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(GroceryItem(
          id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _enteredCategory!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new item."),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 30,
                  decoration: const InputDecoration(
                    label: Text("Input name"),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return "Please enter corrrct name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredName = value.toString();
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Quantity"),
                        ),
                        keyboardType: TextInputType.number,
                        initialValue: _enteredQuantity.toString(),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return "Must be a correct posative value";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredQuantity = int.tryParse(value!)!;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                          value: _enteredCategory,
                          items: [
                            for (final category in categories.entries)
                              DropdownMenuItem(
                                  value: category.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        color: category.value.color,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(category.value.title)
                                    ],
                                  ))
                          ],
                          onChanged: (value) {
                            setState(() {
                              _enteredCategory = value;
                            });
                          }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                        },
                        child: const Text("Reset")),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _saveItem();
                        },
                        child: Text("Add item.")),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
