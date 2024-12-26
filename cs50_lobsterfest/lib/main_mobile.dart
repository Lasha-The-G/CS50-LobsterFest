import 'package:flutter/material.dart';
import 'package:something_first/note_page.dart';
import 'package:something_first/text_page.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
  int currentPageIndex = 0;
  final List<Widget> _pages = [TextPage(), ListWihParts()];

  void _navigateBottomBar(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Color(0xff74AA9C),
                offset: Offset(0, 0),
                blurRadius: 15,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(23),
            border: Border.all(width: 1.3, color: Colors.white),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            currentIndex: currentPageIndex,
            onTap: _navigateBottomBar,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: "output"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.note_add,
                    color: Colors.white,
                  ),
                  label: "Notes"),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Demo App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _pages[currentPageIndex],
    );
  }
}
