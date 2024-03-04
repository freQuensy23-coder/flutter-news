import 'package:flutter/material.dart';

/// Flutter code sample for [Card].

void main() => runApp(const CardExampleApp());

class CardExampleApp extends StatelessWidget {
  const CardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Card Sample')),
        body: const CardExample(),
      ),
    );
  }
}

class NewsItems extends StatelessWidget{
  const NewsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity, // Fit screen width
      height: 100,
      child: Card(
        child: Center(child: Text('Hello World!')),
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(100, (index) => const NewsItems())
      )
    );
  }
}