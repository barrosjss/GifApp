import 'package:flutter/material.dart';
import 'package:gyphi/Pages/Gif_Page.dart';
import '../Pages/Home_Page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GifApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const GifPage(),
    );
  }
}
