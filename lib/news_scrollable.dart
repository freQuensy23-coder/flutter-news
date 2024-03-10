import 'package:flutter/material.dart';

import 'package:untitled/api.dart';

import 'article.dart';
import 'dart:developer' as developer;

import 'newsItemWidget.dart';
import 'news_scrollable.dart';


class NewsScrollableListWidget extends StatefulWidget {
  const NewsScrollableListWidget({super.key});

  @override
  State<NewsScrollableListWidget> createState() => _NewsScrollableListWidgetState();
}

class _NewsScrollableListWidgetState extends State<NewsScrollableListWidget> {
  List<Article> news = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    NewsApi newsApi = NewsApi('caa4f3ab268e4168bce63b547dd1e8a0');
    var fetchedNews = await newsApi.fetchTopHeadlines('us');
    setState(() {
      news= fetchedNews;});
    developer.log('Fetched $news');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: news.map((article) => NewsItem(article: article)).toList(),
      ),
    );
  }
}
