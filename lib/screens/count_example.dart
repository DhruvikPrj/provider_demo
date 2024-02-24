import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    super.initState();
    final countProvider =
        Provider.of<CountProvider>(context, listen: false); //Must Add
    Timer.periodic(const Duration(seconds: 0), (timer) {
      countProvider.setCount();
    });
  }

  var count = 0;

  @override
  Widget build(BuildContext context) {
    print("Full Widget Re-build");
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Provider",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
          child: Consumer<CountProvider>(builder: (context, value, child) {
        print("Only This Widget Build");
        return Text(
          value.count.toString(),
          style: const TextStyle(fontSize: 50),
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
