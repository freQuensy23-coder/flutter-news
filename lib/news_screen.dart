import 'package:flutter/material.dart';
import 'package:untitled/mockImages.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer' as developer;

import 'article.dart';

class NewsScreen extends StatelessWidget {
  final Article article;

  const NewsScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // Assuming this is where the title goes
              padding: const EdgeInsets.all(16.0),
              child: Text(
                article.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              height: 200,
              color: Colors.grey[300], // Placeholder color
              child: Center(
                child: Image.network(article.urlToImage ?? mockImageUrl()),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                article.description ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final url = article.url;
          if (await canLaunchUrl(Uri.parse(article.url))) {
            developer.log('Launching $url');
            await launchUrl(Uri.parse(article.url));
          } else {
            developer.log('Could not launch $url');
            // Show an error message
            if (context.mounted){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Could not launch $url'),
                  duration: const Duration(seconds: 2),
                ),
              );
            }

            }
          },
        child: const Icon(Icons.link), // The icon you drew looks like a refresh icon
      ),
    );
  }
}
