// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SlidableContainer extends StatelessWidget {
  final String child;

  SlidableContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.5, top: 0.5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.black,
            border: Border.all(width: 1.5, color: Colors.white)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              child,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
