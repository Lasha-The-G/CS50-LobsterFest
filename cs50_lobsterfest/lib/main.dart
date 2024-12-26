import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:something_first/audio_page.dart';
import 'package:something_first/globals.dart';
import 'package:something_first/main_desktop.dart';
import 'package:something_first/main_mobile.dart';
import 'package:something_first/responsive_layout.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ArrayProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileBody: MainMobile(),
        desktopBody: MainDesktop(),
      ),
    );
    // MaterialApp(  //სანამ აუდიოს გვერდზე მუშაობთ ზემოთ რაცაა დააკომენტეთ
    //   home: audioInput(), // და ეს მთლიანი ნაწილი ჩასვით
    // );
  }
}
