import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_widget_app/model/item.dart';
import 'package:simple_widget_app/widget/todolistTile.dart';

enum FilterOptions { all, completed, uncompleted }

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  State<ToDoListPage> createState() => ToDoListPageState();
}

class ToDoListPageState extends State<ToDoListPage> {
    List<Item> items = [
    Item(name: "Item 1", completeStatus: true),
    Item(name: "Item 2", completeStatus: false),
    Item(name: "Item 3", completeStatus: true),
    Item(name: "Item 4", completeStatus: false),
    Item(name: "Item 5", completeStatus: false),
    Item(name: "Item 6", completeStatus: false)
  ];

  FilterOptions selectedFilter = FilterOptions.all;

  void updateStatus(String name, bool completeStatus){
      items = items.map((item) {
        if (item.name == name) {
          return Item(name: item.name, completeStatus: completeStatus);
        }
        return item;
      }).toList();

      setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Column(
              children: [
                RadioListTile<FilterOptions>(
                  title: Text('All'),
                  value: FilterOptions.all,
                  groupValue: selectedFilter,
                  onChanged: (FilterOptions? value) {
                    setState(() {

                      selectedFilter = value!;
                    });
                  },
                ),
                RadioListTile<FilterOptions>(
                  title: Text('Completed'),
                  value: FilterOptions.completed,
                  groupValue: selectedFilter,
                  onChanged: (FilterOptions? value) {
                    setState(() {
                      selectedFilter = value!;
                    });
                  },
                ),
                RadioListTile<FilterOptions>(
                  title: Text('Uncompleted'),
                  value: FilterOptions.uncompleted,
                  groupValue: selectedFilter,
                  onChanged: (FilterOptions? value) {
                    setState(() {

                      selectedFilter = value!;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context,int index){
                return ToDoListTile(item: items[index], parentState: this,);
              }),
            )
          ],
        ),
      
    );
  }
}
