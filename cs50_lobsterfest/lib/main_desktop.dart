import 'package:flutter/material.dart';
import 'package:something_first/note_page.dart';
import 'package:something_first/text_page.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 7.0,
                left: 14.0,
                top: 14.0,
                bottom: 14.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: TextPage(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 14.0,
                left: 7.0,
                top: 14.0,
                bottom: 14.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: ListWihParts(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
