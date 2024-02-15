import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Stateless as Stateful')),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: InkWell(
                          onTap: () {
                            toggle.value = !toggle.value;
                          },
                          child: Icon(toggle.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility))),
                );
              }),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Center(
                    child: Text(
                      _counter.value.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
