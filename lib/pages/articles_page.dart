
import 'package:flutter/material.dart';
import 'package:newsiverse/animations/error_loading.dart';
import 'package:newsiverse/animations/loading.dart';
import 'package:newsiverse/widgets/news_box.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/get_feed_data.dart';


class ArticlePage extends StatefulWidget {
  final String feed;
  final String newsType;
  const ArticlePage({Key? key, required this.feed, required this.newsType})
      : super(key: key);

  @override
  _ArticlePageState createState() =>
      _ArticlePageState(feed, newsType);
}

class _ArticlePageState extends State<ArticlePage> {
  final String feed;
  final String newsType;
  late Future<List> articles;

  _ArticlePageState(this.feed, this.newsType);

  @override
  Widget build(BuildContext context) {
    GetFeedData rss = new GetFeedData();
    articles = rss.read(this.feed);
    print(articles);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Home",
          style: TextStyle(
              fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w700),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            padding: EdgeInsets.only(left: 10),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: Colors.black87,
              weight: 800,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xfffbfbfb),
          Color(0xfff9f5fd),
          Color(0xfffcfcfc)
        ])),
        child: FutureBuilder(
          future: articles,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const LoadingAnimation();
              default:
                if (snapshot.hasError) {
                  return const ErrorLoadingAnimation();
                }
                return listArticles(snapshot.data);
            }
          },
        ),
      ),
    );
  }

  messageTemplate({required String title, required IconData icon}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(icon, size: 80), Text(title)],
      ),
    );
  }

  listArticles(List? articles) {
    return Column(children: <Widget>[
      Expanded(
        child: ListView.builder(
          itemCount: articles!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                String url = articles[index]['link'];
                canLaunch(url).then((isConfirmed) {
                  if (isConfirmed) {
                    launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                });
              },
              child: MyNewsBox(
                  imageUrl: articles[index]['img'],
                  title: articles[index]['title'],
                  newsType: newsType,
                  dayTime: articles[index]['pubDate']),
            );
          },
        ),
      )
    ]);
  }
}
