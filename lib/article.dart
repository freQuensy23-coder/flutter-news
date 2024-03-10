class Article {
    final String title;
    final String? description;
    final String url; // Assuming every article must have a URL
    final String? urlToImage;
    final DateTime? publishedAt;
    final String? content;

    Article({
        required this.title,
        this.description,
        required this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    @override
    String toString() {
        return 'Article{title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content}';
    }

    factory Article.fromJson(Map<String, dynamic> json) {
        return Article(
            title: json['title'],
            description: json['description'],
            url: json['url'],
            urlToImage: json['urlToImage'],
            publishedAt: DateTime.parse(json['publishedAt']),
            content: json['content'],
        );
    }
}