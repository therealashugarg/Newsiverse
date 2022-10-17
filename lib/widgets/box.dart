// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String title;
  MyTextBox({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Color(0xffd7dede),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(title,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500)))))));
  }
}
