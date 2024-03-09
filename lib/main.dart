import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const CardExampleApp());


String prettifyName(String name) {
  if (name.length < 15) {
    return name;
  }
  return '${name.substring(0, 12)}...';

}
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
  const NewsItems({super.key, required this.title, this.subtitle='No subtitle'});

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


class CardExample extends StatefulWidget {
  const CardExample({super.key});

  @override
  State<CardExample> createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  List<String> _newsTitles = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=caa4f3ab268e4168bce63b547dd1e8a0'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> articles = data['articles'];
      setState(() {
        _newsTitles = articles.map((article) => prettifyName(article['title'] as String)).toList();
      });
    } else {
      // Обработка ошибки
      print('Failed to load news. Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: _newsTitles.map((title) => NewsItems(title: title)).toList(),
      ),
    );
  }
}
