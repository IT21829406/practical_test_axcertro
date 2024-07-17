import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'details_screen.dart';
import 'api_service.dart';
import 'favorites_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> futureItems;

  @override
  void initState() {
    super.initState();
    futureItems = ApiService().fetchItems();
    Provider.of<FavoritesProvider>(context, listen: false).loadFromPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: futureItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No items found'));
          } else {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isFavorite = Provider.of<FavoritesProvider>(context).favoriteItems.contains(item['id']);
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Icon(isFavorite ? Icons.star : Icons.star_border, color: isFavorite ? Colors.amber : Colors.grey),
                    title: Text(item['title'], style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(item['body'], style: Theme.of(context).textTheme.subtitle1),
                    trailing: IconButton(
                      icon: Icon(isFavorite ? Icons.star : Icons.star_border),
                      onPressed: () {
                        Provider.of<FavoritesProvider>(context, listen: false).toggleFavorite(item['id']);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(item: item),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
