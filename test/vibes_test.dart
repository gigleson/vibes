import 'package:flutter_test/flutter_test.dart';
import 'package:vibes/models/song.dart';
import 'package:vibes/repo/song_repo.dart';
import 'package:vibes/viewModel/PlayerVM.dart';


void main() {
  group('SongRepository Test', () {
    test('Upload Song', () async {
      final songRepository = SongRepository();
      final title = 'Test Song';
      final artist = 'Test Artist';
      final url = 'https://example.com/test.mp3';

      await songRepository.uploadSong(
        title: title,
        artist: artist,
        url: url,
      );

      // You can add assertions based on your specific implementation or requirements.
      // For example, you might want to check if the song is present in the Firestore collection.
    });

    test('Get Songs', () async {
      final songRepository = SongRepository();

      final songs = await songRepository.getSongs();

      // You can add assertions based on your specific implementation or requirements.
      // For example, you might want to check if the returned songs list is not empty.
      expect(songs.isNotEmpty, true);
    });
  });

  group('PlayerViewModel Test', () {
    test('Upload Song', () async {
      final playerViewModel = PlayerViewModel();
      final title = 'Test Song';
      final artist = 'Test Artist';
      final url = 'https://example.com/test.mp3';

      await playerViewModel.uploadSong(
        title: title,
        artist: artist,
        url: url,
      );

      // You can add assertions based on your specific implementation or requirements.
      // For example, you might want to check if the songs list in the view model is updated.
      expect(playerViewModel.songs.length, 1);
    });

    test('Load Songs', () async {
      final playerViewModel = PlayerViewModel();

      await playerViewModel.loadSongs();

      // You can add assertions based on your specific implementation or requirements.
      // For example, you might want to check if the songs list in the view model is not empty.
      expect(playerViewModel.songs.isNotEmpty, true);
    });
  });
}
