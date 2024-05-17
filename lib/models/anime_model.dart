// models/anime_model.dart
class Anime {
  final String title;
  final String type;
  final String synopsis;
  final String rating;
  final String year;
  final String imageUrl;
  final String youtubeURL;

  Anime({
    required this.title,
    required this.type,
    required this.synopsis,
    required this.rating,
    required this.year,
    required this.imageUrl,
    required this.youtubeURL,
  });
}
