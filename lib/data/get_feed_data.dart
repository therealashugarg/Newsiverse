import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:webfeed/webfeed.dart';

class GetFeedData {
  Future<List> read(String url) async {
    http.Client client = http.Client();
    dynamic data = await client.get(Uri.parse(url));
    xml.XmlDocument rss = xml.parse(data.body);

    List articles = [];

    rss.findAllElements('item').forEach((node) {
      articles.add({
        'title': node.findElements('title').single.text,
        'link': node.findElements('link').single.text,
        'img': node.findElements('thumbimage').single.text,
        'pubDate': node.findElements('pubDate').single.text
      });
    });

    // final now = rss.findElements('pubDate').single.text;
    // String time = DateFormat('h:mm a - EEE').format(now as DateTime).toString();
    // articles.add({'pubDate': now});

    return articles;
  }
}
