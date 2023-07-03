// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoo/ListModel.dart';
import 'package:todoo/list.dart';
import 'package:todoo/notifierLists.dart';

class MyHomePage extends StatelessWidget {
  void floatPress(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19), topRight: Radius.circular(19)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Add new',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _text,
                  autofocus: true,
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {
                    addTodo(context);
                  },
                  child: Text('Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTodo(BuildContext context) {
    final text = _text.text.trim();

    if (text.isEmpty) {
      return;
    }
    final task = ListModel(tasks: text);

    addTask(task);
    Navigator.pop(context);
  }

  final _text = TextEditingController();
  bool check = false;
  @override
  Widget build(BuildContext context) {
    getAllTasks();
    return ValueListenableBuilder(
      valueListenable: taskNotifier,
      builder: (context, List<ListModel> tsks, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            floatPress(context);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.orange,
        ),
        backgroundColor: Colors.orangeAccent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list_rounded,
                        color: Colors.orangeAccent,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "TodZz..",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Text(
                      '${tsks.length} Tasks',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(19),
                        topRight: Radius.circular(19)),
                  ),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final data = tsks[index];
                        return ForLists(
                          remove: data.tasks,
                          something: data.tasks,
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: tsks.length),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
