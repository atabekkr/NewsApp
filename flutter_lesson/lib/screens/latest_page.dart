import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_lesson/models/article.dart';
import 'package:http/http.dart' as http;

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<StatefulWidget> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {

  List<Articles> articles = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return newsItem(articles[index]);
        },
        itemCount: articles.length);
  }

  Widget newsItem(Articles news) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Maslahatlar',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${news.publishedAt} | ? |",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.visibility_outlined, color: Colors.blue[300]),
                  const SizedBox(width: 4),
                  // Text('${news.watchCount}')
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${news.urlToImage}', width: 140),
              const SizedBox(width: 12.0),
              Expanded(
                  child: Text(
                "${news.title}",
                style:
                    const TextStyle(fontWeight: FontWeight.w500, height: 1.2),
              ))
            ],
          ),
          const Divider(thickness: 1.0)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    String sampleUrl =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-05-22&sortBy=publishedAt&apiKey=8a2b108a7be64432b688239c802c986e";

    final response = await http.get(Uri.parse(sampleUrl));

    print(response.body);

    final Map<String, dynamic> body = jsonDecode(response.body);
    final Article article = Article.fromJson(body);

    setState(() {
      articles = article.articles!;
    });

  }
}
