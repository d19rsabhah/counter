import 'package:counter/provider/auth_provider.dart';
import 'package:counter/provider/count_provider.dart';
import 'package:counter/provider/example_one_provider.dart';
import 'package:counter/provider/favourite_provider.dart';
import 'package:counter/provider/theme_changer_provider.dart';
import 'package:counter/screen/count_example.dart';
import 'package:counter/screen/dark_theme.dart';
import 'package:counter/screen/example_one.dart';
import 'package:counter/screen/favourite/favourite_screen.dart';
import 'package:counter/screen/login.dart';
import 'package:counter/screen/value_notify_listner.dart';
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
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider())
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.blue,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.blue,
                )),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.lightBlue,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.teal,
                ),
                iconTheme: IconThemeData(color: Colors.red)),
            home: LogInScreen(),
          );
        }));
  }
}
