// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MyNewsBox extends StatelessWidget {
  final String title;
  String imageUrl;
  String newsType;
  String dayTime;
  MyNewsBox(
      {required this.title, required this.imageUrl, required this.dayTime, required this.newsType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      child: Container(
        height: 128,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 128,
              width: MediaQuery.of(context).size.width - 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xfff9f5fd),
                      spreadRadius: 5,
                      offset: Offset(4, -5),
                      blurRadius: 5)
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 92,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30)),
                            child: ShaderMask(
                              blendMode: BlendMode.darken,
                              shaderCallback: (rect) => LinearGradient(
                                      colors: [
                                    HexaColor("#8d1aff").withOpacity(1),
                                    HexaColor("#9d97f5").withOpacity(0.6),
                                    HexaColor("#acd7ed").withOpacity(1)
                                  ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)
                                  .createShader(rect),
                              child: Container(
                                  width: 90,
                                  height: 128,
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 210,
                                    height: 36,
                                    child: Text(title,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                        softWrap: false,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 12),
                                  Container(
                                    height: 24,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: HexaColor("#fff4d1")),
                                    child: Center(
                                        child: Text(newsType,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black))),
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: 12,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        dayTime,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ],
                      )),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xfff7effe),
                              spreadRadius: 10,
                              blurRadius: 15)
                        ]),
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Color HexaColor(String strcolor, {int opacity = 15}) {
  //opacity is optional value
  strcolor = strcolor.replaceAll("#", ""); //replace "#" with empty value
  String stropacity =
      opacity.toRadixString(16); //convert integer opacity to Hex String
  return Color(int.parse("$stropacity$stropacity" + strcolor, radix: 16));
  //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
}
