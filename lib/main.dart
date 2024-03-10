import 'package:flutter/material.dart';
import 'package:untitled/theme_notifier.dart';
import 'news_scrollable.dart';
import 'package:provider/provider.dart';


void main() => runApp(const NewsApp());

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(ThemeData.dark()), // Set default theme here
      child: const NewsAppWithTheme(),
    );
  }
}

class NewsAppWithTheme extends StatelessWidget {
  const NewsAppWithTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                themeNotifier.setTheme(themeNotifier.getTheme().brightness == Brightness.dark ? ThemeData.light() : ThemeData.dark());
              },
            ),
          ],
        ),
        body: const NewsScrollableListWidget(),
      ),
      theme: themeNotifier.getTheme(),
    );
  }
}
