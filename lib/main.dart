import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/screens/nav_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
      ),
      home: NavScreen(),
    );
  }
}
