import 'package:counter/provider/example_one_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  ExampleOne({Key? key}) : super(key: key);

  @override
  _ExampleOneState createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    //  final provider = Provider.of<ExampleOneProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: const Text(
          'Multi Provider',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value),
                    ),
                    child: Center(
                      child: Text('Container 1'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(value.value),
                    ),
                    child: Center(
                      child: Text('Container 2'),
                    ),
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
