import 'package:flutter/material.dart';
import 'package:mytasking/models/items_data.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider<ItemData>(
      create: (BuildContext context) => ItemData(), child: MyTasks()));
}

class MyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.green,
          accentColor: Colors.green,
          appBarTheme: AppBarTheme(color: Colors.green),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              subtitle1: TextStyle(color: Colors.white),
              headline3: TextStyle(color: Colors.white))),
      home: MyHomePage(),
    );
  }
}
