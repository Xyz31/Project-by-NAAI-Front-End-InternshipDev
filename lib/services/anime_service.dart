// services/anime_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime_model.dart';

class AnimeService {
  Future<List<Anime>> fetchAnimeList(String searchString, int page) async {
    final response = await http.get(
        Uri.parse('https://api.jikan.moe/v4/anime?q=$searchString&page=$page'));

    if (response.statusCode == 200) {
      List<Anime> animeList = [];
      final jsonData = json.decode(response.body);

      for (var animeData in jsonData['data']) {
        Anime anime = Anime(
          title: animeData['title'],
          type: animeData['type'],
          synopsis: animeData['synopsis'],
          rating: animeData['rating'],
          year: animeData['year'].toString(),
          imageUrl: animeData['images']['jpg']['large_image_url'].toString(),
          youtubeURL: animeData['trailer']['url'].toString(),
        );
        animeList.add(anime);
      }

      return animeList;
    } else {
      throw Exception('Failed to fetch anime list');
    }
  }
}
