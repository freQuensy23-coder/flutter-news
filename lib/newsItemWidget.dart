import 'package:flutter/material.dart';
import 'package:untitled/mockImages.dart';
import 'dart:developer' as developer;

import 'article.dart';
import 'news_screen.dart';

class  NewsItem extends StatelessWidget{
  final Article article;

  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Fit screen width
      height: 128,
      child:
      GestureDetector(
        onTap: () {
          developer.log('Tapped on ${article.title}');
          // Navigate to the details screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsScreen(article: article),),
          );
        },
        child:
          Card(
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Image.network(article.urlToImage ?? mockImageUrl(),
                    fit: BoxFit.cover),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(article.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text(article.description ?? '',
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.fade, maxLines: 3,),
                  ],
                ),
              ),
            ],),
          ),
      ),
    );
  }
}