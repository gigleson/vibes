import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibes/models/song.dart' as MyAppSongModel;
import 'package:vibes/viewModel/player_controller.dart';

import '../constant/colours.dart'; // Import your PlayerViewModel

class PlaylistPage extends StatelessWidget {
  final List<MyAppSongModel.SongModel> playlist;
  var controller = Get.put(PlayerController());
  PlaylistPage({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
      ),
      body: ListView.builder(
        itemCount: playlist.length,
        itemBuilder: (context, index) {
          return Obx(
              ()=> ListTile(
              title: Text(playlist[index].title),
              subtitle: Text(playlist[index].artist),
              trailing: controller.playIndex.value == index &&
                  controller.isplaying.value
                  ? const Icon(
                Icons.play_arrow,
                color: Colors.black,
                size: 26,
              )
                  : null,

              onTap: () {
                // Play the selected song
                controller.playSong(playlist[index].url, index);
              },
            ),
          );
        },
      ),
    );
  }
}
