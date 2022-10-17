// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorLoadingAnimation extends StatelessWidget {
  const ErrorLoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Center(
          child: SizedBox(
              child: Lottie.asset('assets/animation/error_loading_animation.json'))
              ),
    );
  }
}