// views/anime_details_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';
import '../models/anime_model.dart';

class AnimeDetailsView extends StatelessWidget {
  final Anime anime;

  const AnimeDetailsView({Key? key, required this.anime}) : super(key: key);

  Future<void> _launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid URL'),
            content: const Text('The URL is empty or invalid.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, 40),
        child: AppBar(
          title: Center(
            child: Text(
              anime.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                  wordSpacing: 1.3),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  anime.imageUrl,
                  width: double.infinity, // Full width of the screen
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                anime.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Type: ${anime.type}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Year: ${anime.year}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Rating: ${anime.rating}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Synopsis: ${anime.synopsis}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () => _launchURL(context, anime.youtubeURL),
                    icon: const Icon(Icons.play_circle_fill), // YouTube icon
                    label: const Text(
                      'Watch',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
