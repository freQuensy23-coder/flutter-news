import 'package:flutter/material.dart';
import 'article.dart';
import 'dart:developer' as developer;
import 'dart:math';


String prettifyName(String name) {
  if (name.length < 20) {
    return name;
  }
  return '${name.substring(0, 18)}...';
}

class NewsItem extends StatelessWidget{
  final String title;
  final String subtitle;
  final String imageUrl;
  const NewsItem({super.key,
    required this.title,
    this.subtitle='No subtitle',
    this.imageUrl='https://picsum.photos/250?image=9'});

  factory NewsItem.fromArticle(Article article) {
    developer.log('Creating NewsItems from article: ${article.urlToImage}');
    return NewsItem(
      title: prettifyName(article.title!),
      subtitle: prettifyName(article.description ?? 'No description'),
      imageUrl: article.urlToImage ?? 'https://picsum.photos/250?image=${Random().nextInt(9)}',// Random number from 1 to 9
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Fit screen width
      height: 128,
      child: Card(
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Image.network(imageUrl, fit: BoxFit.cover),
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