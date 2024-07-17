import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_provider.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueAccent,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(color: Colors.black54),
          ),
          iconTheme: IconThemeData(color: Colors.blueAccent),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
