import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/count_provider.dart';
import 'package:provider_demo/screens/count_example.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CountExample(),
      ),
    );
  }
}


