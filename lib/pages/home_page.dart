
import 'package:flutter/material.dart';
import 'package:newsiverse/pages/articles_page.dart';
import 'package:newsiverse/widgets/box.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  final feedController = TextEditingController();

  List news = [
    "Top News",
    "Indian News",
    "World News",
    "Technology",
    "Business",
    "Jobs & Careers",
    "Sports",
    "Entertainment",
    "Lifestyle"
  ];

  List rss = [
    "https://www.tribuneindia.com/rss/feed?catId=0",
    "https://www.tribuneindia.com/rss/feed?catId=42",
    "https://www.tribuneindia.com/rss/feed?catId=57",
    "https://www.tribuneindia.com/rss/feed?catId=47",
    "https://www.tribuneindia.com/rss/feed?catId=19",
    "https://www.tribuneindia.com/rss/feed?catId=37",
    "https://www.tribuneindia.com/rss/feed?catId=50",
    "https://www.tribuneindia.com/rss/feed?catId=221",
    "https://www.tribuneindia.com/rss/feed?catId=38"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Newsiverse",
            style: TextStyle(
                fontSize: 16,
                // color: Colors.black87,
                color: Color(0xfff9f5fd),
                fontWeight: FontWeight.w700),
          ),
          backgroundColor: Color.
          fromARGB(255, 30, 35, 35),
          elevation: 0,
          // toolbarHeight: 65
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xfffbfbfb),
            Color(0xfff9f5fd),
            Color(0xfffcfcfc)
          ])),
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 30),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticlePage(
                                  feed: rss[index],
                                  newsType: news[index]
                                ),
                              )),
                          child: MyTextBox(title: news[index]));
                    },
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
