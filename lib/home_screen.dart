import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        count++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Provider",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              DateTime.now().hour.toString() +
                  " : " +
                  DateTime.now().minute.toString() +
                  " : " +
                  DateTime.now().second.toString(),
              style: TextStyle(fontSize: 40),
            ),
          ),
          Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
