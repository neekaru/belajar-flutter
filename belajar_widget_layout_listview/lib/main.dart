import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class Article {
  final String imageUrl;
  final String title;
  final String description;

  Article({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Article> articles = [
    Article(
      imageUrl: 'https://picsum.photos/300/200',
      title: 'Artikel 1',
      description: 'Nasi Padang Berapa',
    ),
    Article(
      imageUrl: 'https://picsum.photos/300/201',
      title: 'Artikel 2',
      description: 'Deskripsi artikel 2',
    ),
    Article(
      imageUrl: 'https://picsum.photos/300/202',
      title: 'Artikel 3',
      description: 'Deskripsi artikel 3',
    ),
    Article(
      imageUrl: 'https://picsum.photos/300/203',
      title: 'Artikel 4',
      description: 'Deskripsi artikel 4',
    ),
    Article(
      imageUrl: 'https://picsum.photos/300/204',
      title: 'Artikel 5',
      description: 'Deskripsi artikel 5',
    ),
  ];

  Widget _buildCard(Article article) {
    return Card(
      child: ListTile(
        leading: Image.network(article.imageUrl, width: 100, height: 100, fit: BoxFit.cover),
        title: Text(article.title),
        subtitle: Text(article.description),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }

  @override
  build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          leading: const Icon(Icons.home),
          title: const Text('Flutter Layout'),
        ),

        body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return _buildCard(articles[index]);
          },
        )
      )
    );
  }
}

