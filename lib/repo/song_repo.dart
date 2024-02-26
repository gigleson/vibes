// song_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vibes/models/song.dart';

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
  Future<List<SongModel>> getSongs() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
      await songsCollection.get() as QuerySnapshot<Map<String, dynamic>>;

      List<SongModel> songs = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data()!;
        return SongModel(
          title: data['title'],
          artist: data['artist'],
          url: data['url'],
        );
      }).toList();

      return songs;
    } catch (e) {
      print('Error getting songs: $e');
      throw e;
    }
  }
}
