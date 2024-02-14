import 'package:counter/provider/count_provider.dart';
import 'package:counter/provider/example_one_provider.dart';
import 'package:counter/provider/favourite_provider.dart';
import 'package:counter/screen/count_example.dart';
import 'package:counter/screen/example_one.dart';
import 'package:counter/screen/favourite/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: FavouriteScreen(),
        ));
  }
}
