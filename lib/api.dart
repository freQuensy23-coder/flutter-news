import 'dart:convert';
import 'dart:developer' as developer; // Import dart:developer for logging
import 'article.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  final String _baseUrl = 'https://newsapi.org/v2';
  final String _apiKey;

  NewsApi(this._apiKey);

  Future<List<Article>> fetchTopHeadlines(String countryCody) async {
    final url = '$_baseUrl/top-headlines?country=$countryCody&apiKey=$_apiKey';
    developer.log('Fetching top headlines from $url'); // Log the request URL

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      developer.log('Successfully fetched top headlines'); // Log success
      final result = json.decode(response.body);
      Iterable list = result['articles'];
      developer.log('Fetched ${list.length} articles'); // Log the number of articles fetched
      return list.map((article) => Article.fromJson(article)).toList();
    } else {
      developer.log('Failed to fetch top headlines: ${response.body}'); // Log failure
      throw Exception('Failed to load top headlines');
    }
  }
}
