import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:something_first/globals.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  final List<String> myText = [
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)",
    "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.",
  ];

  void appendSelectedText() async {
    final clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null && clipboardData.text != null) {
      Provider.of<ArrayProvider>(context, listen: false)
          .addItem(clipboardData.text!);
    }
  }

  int current_text_version = 0;
  void changeOutputText() {
    setState(() {
      if (current_text_version == 0)
        current_text_version = 1;
      else
        current_text_version = 0;
    });
  }

  static double min_BoxHeight = 50;
  static double max_BoxHeight = 60;

  static double min_BoxWidth = 100;
  static double max_BoxWidth = 120;

  static double min_fontsize = 22;
  static double max_fontsize = 28;

  double BoxHeight_1 = min_BoxHeight;
  double BoxWidth_1 = min_BoxWidth;
  double fontsize_1 = min_fontsize; // Big

  double BoxHeight_2 = max_BoxHeight;
  double BoxWidth_2 = max_BoxWidth;
  double fontsize_2 = max_fontsize; // Big

  void changeMenuBoxSize_1() {
    setState(() {
      current_text_version = 1;

      if (BoxHeight_1 == min_BoxHeight ||
          BoxWidth_1 == min_BoxWidth ||
          fontsize_1 == min_fontsize) {
        BoxHeight_1 = max_BoxHeight;
        BoxWidth_1 = max_BoxWidth;
        fontsize_1 = max_fontsize;
      }

      BoxHeight_2 = min_BoxHeight;
      BoxWidth_2 = min_BoxWidth;
      fontsize_2 = min_fontsize;
    });
  }

  void changeMenuBoxSize_2() {
    setState(() {
      current_text_version = 0;

      if (BoxHeight_2 == min_BoxHeight ||
          BoxWidth_2 == min_BoxWidth ||
          fontsize_2 == min_fontsize) {
        BoxHeight_2 = max_BoxHeight;
        BoxWidth_2 = max_BoxWidth;
        fontsize_2 = max_fontsize;
      }

      BoxHeight_1 = min_BoxHeight;
      BoxWidth_1 = min_BoxWidth;
      fontsize_1 = min_fontsize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: changeMenuBoxSize_1,
                  child: AnimatedContainer(
                    child: Center(
                      child: TweenAnimationBuilder<double>(
                        tween:
                            Tween<double>(begin: fontsize_1, end: fontsize_1),
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                        builder: (context, size, child) {
                          return Text(
                            "Raw",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size,
                            ),
                          );
                        },
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                      ),
                      color: Colors.black,
                    ),
                    height: BoxHeight_1,
                    width: BoxWidth_1,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                  ),
                ),
                GestureDetector(
                  onTap: changeMenuBoxSize_2,
                  child: AnimatedContainer(
                    child: Center(
                      child: TweenAnimationBuilder<double>(
                        tween:
                            Tween<double>(begin: fontsize_2, end: fontsize_2),
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                        builder: (context, size, child) {
                          return Text(
                            "Edited",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size,
                            ),
                          );
                        },
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                      ),
                      color: Colors.black,
                    ),
                    height: BoxHeight_2,
                    width: BoxWidth_2,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                    top: 7.0,
                  ),
                  child: SelectableText(
                    myText[current_text_version],
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: 16,
          bottom: 28,
          child: GestureDetector(
            onTap: appendSelectedText,
            child: Container(
              height: 70,
              width: 70,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(width: 1.3, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff74AA9C),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
