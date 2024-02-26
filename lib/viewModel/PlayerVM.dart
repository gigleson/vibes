// player_view_model.dart
import 'package:get/get.dart';
import 'package:vibes/models/song.dart';
import 'package:vibes/repo/song_repo.dart';


class PlayerViewModel extends GetxController {
  final SongRepository _songRepository = SongRepository();
  List<SongModel> songs = <SongModel>[].obs;

  Future<void> uploadSong({
    required String title,
    required String artist,
    required String url,
  }) async {
    try {
      await _songRepository.uploadSong(
        title: title,
        artist: artist,
        url: url,
      );
    } catch (e) {
      print('Error uploading song: $e');
      rethrow; // Rethrow the error for handling in the calling code
    }
  }
  Future<void> loadSongs() async {
    try {
      songs.assignAll(await _songRepository.getSongs());
    } catch (e) {
      print('Error loading songs: $e');
    }
  }
}



