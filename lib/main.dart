import 'package:flutter/material.dart';

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
  final String title;
  final String subtitle;
  const NewsItems({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Fit screen width
      height: 128,
      child: Card(
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                Text(subtitle, style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
        ],),
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
            children: List.generate(100,
                    (index) => NewsItems(title: 'news.dart item $index',
                    subtitle: 'Subtitle $index'))
        )
    );
  }
}