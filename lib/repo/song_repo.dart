// song_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class SongRepository {
  final CollectionReference songsCollection =
  FirebaseFirestore.instance.collection('songs');

  Future<void> uploadSong({
    required String title,
    required String artist,
    required String url,
  }) async {
    try {
      await songsCollection.add({
        'title': title,
        'artist': artist,
        'url': url,
      });
    } catch (e) {
      print('Error uploading song: $e');
      throw e;
    }
  }
}
