import 'package:flutter/material.dart';
import 'package:recipes_app/core/data/app_database.dart';

void main() async {
  await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(),
    );
  }
}
