import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  DetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item['title'], style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10),
            Text(item['body'], style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
      ),
    );
  }
}
