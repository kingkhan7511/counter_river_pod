import 'package:counter_river_pod/application/counter_notifier.dart';
import 'package:counter_river_pod/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nice_button/NiceButton.dart';

class SeconedCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final state = watch(counterNotifierProvider.state);
          if (state is CounterInitialize) {
            return _initialWiget();
          } else if (state is CounterLoaded) {
            return counterWidget(context, state.counter);
          } else {
            return _initialWiget();
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'F3',
            onPressed: () =>
                {context.read(counterNotifierProvider).increament()},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'F4',
            onPressed: () =>
                {context.read(counterNotifierProvider).decreament()},
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  _initialWiget() {
    return Center(child: CircularProgressIndicator());
  }

  counterWidget(BuildContext context, int counterValue) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Current value of counter',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Text(
            counterValue.toString(),
            style: TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: NiceButton(
              elevation: 8.0,
              radius: 52.0,
              text: "Navigate to 1st page",
              background: Colors.red,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
