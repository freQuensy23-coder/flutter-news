import 'package:flutter/material.dart';

import 'package:untitled/api.dart';

import 'article.dart';
import 'dart:developer' as developer;

import 'newsItemWidget.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('News')),
        body: const NewsScrollableListWidget(),
      ),
    );
  }
}


class NewsScrollableListWidget extends StatefulWidget {
  const NewsScrollableListWidget({super.key});

  @override
  State<NewsScrollableListWidget> createState() => _CardExampleState();
}

class _CardExampleState extends State<NewsScrollableListWidget> {
  List<Article> news = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    NewsApi newsApi = NewsApi('caa4f3ab268e4168bce63b547dd1e8a0');
    var fetchedNews = await newsApi.fetchTopHeadlines('us');
    setState(() {news = fetchedNews;});
    developer.log('Fetched $news');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: news.map((article) => NewsItem.fromArticle(article)).toList(),
      ),
    );
  }
}
