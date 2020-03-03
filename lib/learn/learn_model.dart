class Rates {
    final String status;
    final int totalResults;
    final List<Article> articles;

    Rates({
        this.status,
        this.totalResults,
        this.articles,
    });

    factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    final Source source;
    final String author;
    final String title;
    final String description;
    final String url;
    final String urlToImage;
    final DateTime publishedAt;
    final String content;

    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content == null ? null : content,
    };
}

class Source {
    final Id id;
    final Name name;

    Source({
        this.id,
        this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]],
        name: nameValues.map[json["name"]],
    );

    Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": nameValues.reverse[name],
    };
}

enum Id { TECHCRUNCH }

final idValues = EnumValues({
    "techcrunch": Id.TECHCRUNCH
});

enum Name { TECH_CRUNCH }

final nameValues = EnumValues({
    "TechCrunch": Name.TECH_CRUNCH
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
