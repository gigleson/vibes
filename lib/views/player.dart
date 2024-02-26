import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vibes/constant/colours.dart';
import 'package:vibes/constant/text_style.dart';
import 'package:vibes/viewModel/player_controller.dart';

class Player extends StatelessWidget {
  final List<SongModel> data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<PlayerController>();

    void _handleUploadButtonPressed(BuildContext context) async {
      // Replace with your logic to get information about the current song
      String title = data[controller.playIndex.value].title;
      String? artist = data[controller.playIndex.value].artist.toString();
      String? url = data[controller.playIndex.value].uri.toString();

      // Call the uploadSong method from PlayerController
      await controller.uploadSong(
        title: title,
        artist: artist,
        url: url,
      );

      // Optionally, you can add logic here to handle the result of the upload
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Song uploaded successfully!'),
        ),
      );
    }
    return Scaffold(
      backgroundColor: bgColour,
      appBar: AppBar(),
      body: Column(children: [
        Obx(
          ()=> Expanded(
              child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: QueryArtworkWidget(
                    id: data[controller.playIndex.value].id,
                    type: ArtworkType.AUDIO,
                    artworkHeight: double.infinity,
                    artworkWidth: double.infinity,
                    nullArtworkWidget: Icon(
                      Icons.music_note,
                      size: 48,
                      color: whiteColour,
                    ),
                  ))),
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: whiteColour,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Obx(()=> Column(children: [
              Text(
                data[controller.playIndex.value].displayNameWOExt,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: ourStyle(color: bgdarkColour, size: 24),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                data[controller.playIndex.value].artist.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: ourStyle(color: bgdarkColour, size: 20),
              ),
              const SizedBox(
                height: 12,
              ),
              Obx(
                () => Row(
                  children: [
                    Text(
                      controller.positon.value,
                      style: ourStyle(color: bgColour),
                    ),
                    Expanded(
                        child: Slider(
                            thumbColor: slideColour,
                            inactiveColor: bgColour,
                            activeColor: slideColour,
                            min: Duration(seconds: 0).inSeconds.toDouble(),
                            max: controller.max.value,
                            value: controller.value.value,
                            onChanged: (newValue) {
                              controller
                                  .changeDurationToSeconds(newValue.toInt());
                              newValue = newValue;
                            })),
                    Text(
                      controller.duration.value,
                      style: ourStyle(color: bgColour),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.playSong(data[controller.playIndex.value -1].uri,
                            controller.playIndex.value - 1);
                      },
                      icon: Icon(
                        Icons.skip_previous_rounded,
                        size: 40,
                        color: bgdarkColour,
                      )),
                  Obx(
                    () => CircleAvatar(
                        radius: 35,
                        backgroundColor: bgdarkColour,
                        child: Transform.scale(
                            scale: 2.5,
                            child: IconButton(
                                onPressed: () {
                                  if (controller.isplaying.value) {
                                    controller.audioPlayer.pause();
                                    controller.isplaying(false);
                                  } else {
                                    controller.audioPlayer.play();
                                    controller.isplaying(true);
                                  }
                                },
                                icon: controller.isplaying.value
                                    ? const Icon(
                                        Icons.pause,
                                        color: whiteColour,
                                      )
                                    : const Icon(
                                        Icons.play_arrow_rounded,
                                        color: whiteColour,
                                      )))),
                  ),
                  IconButton(
                      onPressed: () {
                          controller.playSong(data[controller.playIndex.value +1].uri,
                            controller.playIndex.value + 1);
                      
                      },
                      icon: Icon(
                        Icons.skip_next_rounded,
                        size: 40,
                        color: bgdarkColour,
                      )),
                ],
              ),
            ElevatedButton(onPressed: () => _handleUploadButtonPressed(context), child: Text('Upload Song'))
            ]),
          ),
        ),

        ),

      ],

      ),
    );
  }
}
