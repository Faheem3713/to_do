import 'package:flutter/material.dart';

import 'package:todoo/ListModel.dart';
import 'package:todoo/home.dart';
import 'package:todoo/notifierLists.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
