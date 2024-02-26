import 'dart:ffi';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibes/viewModel/PlayerVM.dart';

class PlayerController extends GetxController {
  final audiQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();
  final PlayerViewModel _playerViewModel = PlayerViewModel();
  var playIndex = 0.obs;
  var isplaying = false.obs;

  var duration = "".obs;
  var positon = "".obs;

  var max = 0.0.obs;
  var value = 0.0.obs;

  void OnInit() {
    super.onInit();
    checkPermission();
  }

  updatePosition() {
    audioPlayer.durationStream.listen((d) {
      duration.value = d.toString().split(".")[0];
      max.value = d!.inSeconds.toDouble();
    });
    audioPlayer.positionStream.listen((p) {
      positon.value = p.toString().split(".")[0];
      value.value = p.inSeconds.toDouble();
    });
  }

  changeDurationToSeconds(seconds) {
    var duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }

  playSong(String? uri, index) {
    playIndex.value = index;
    try {
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      audioPlayer.play();
      isplaying(true);
      updatePosition();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  checkPermission() async {
    var perm = await Permission.storage.request();
    if (perm.isGranted) {
    } else {
      checkPermission();
    }
  }
  Future<void> uploadSong({
    required String title,
    required String artist,
    required String url,
  }) async {
    try {
      await _playerViewModel.uploadSong(
        title: title,
        artist: artist,
        url: url,
      );
    } catch (e) {
      print('Error uploading song: $e');
      // Handle the error as needed (e.g., show a message to the user)
    }
  }
}
