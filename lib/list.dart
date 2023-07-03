import 'package:flutter/material.dart';
import 'package:todoo/notifierLists.dart';

class ForLists extends StatelessWidget {
  ForLists({required this.something, required this.remove});
  ValueNotifier<bool> check = ValueNotifier(false);
  final something;
  final remove;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: check,
      builder: (context, value, child) => ListTile(
        title: Text(
          '$something',
          style: TextStyle(
              decoration:
                  check.value == true ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            value: check.value,
            onChanged: (value) {
              check.value = value!;
            }),
        onLongPress: () {
          removeTask(remove);
        },
      ),
    );
  }
}
