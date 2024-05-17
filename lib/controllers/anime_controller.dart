// controllers/anime_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/anime_model.dart';
import '../services/anime_service.dart';

class AnimeController extends GetxController {
  var animeList = <Anime>[].obs;
  var isLoading = true.obs;
  var isLoadingMore = false.obs;
  var currentPage = 1.obs;

  final AnimeService animeService = AnimeService();

  @override
  void onInit() {
    super.onInit();
    loadAnime();
  }

  Future<void> loadAnime() async {
    String query = ""; // Add your query here
    isLoading.value = true;
    try {
      List<Anime> newAnimeList =
          await animeService.fetchAnimeList(query, currentPage.value);
      animeList.addAll(newAnimeList);
    } catch (e) {
      // Handle error
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMoreAnime() async {
    String query = ""; // Add your query here
    isLoadingMore.value = true;
    try {
      currentPage.value++;
      List<Anime> newAnimeList =
          await animeService.fetchAnimeList(query, currentPage.value);
      animeList.addAll(newAnimeList);
    } catch (e) {
      // Handle error
      debugPrint(e.toString());
    } finally {
      isLoadingMore.value = false;
    }
  }
}
