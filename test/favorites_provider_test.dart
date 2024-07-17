import 'package:flutter_test/flutter_test.dart';
import 'package:test_axcertro/favorites_provider.dart';

void main() {
  group('FavoritesProvider', () {
    test('Toggle favorite', () {
      final provider = FavoritesProvider();

      provider.toggleFavorite(1);
      expect(provider.favoriteItems.contains(1), true);

      provider.toggleFavorite(1);
      expect(provider.favoriteItems.contains(1), false);
    });
  });
}
