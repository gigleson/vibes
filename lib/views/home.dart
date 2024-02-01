import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vibes/constant/colours.dart';
import 'package:vibes/constant/text_style.dart';
import 'package:vibes/viewModel/player_controller.dart';
import 'package:vibes/views/player.dart';


class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(
      backgroundColor: bgdarkColour,
      appBar: AppBar(
        backgroundColor: bgdarkColour,
        actions: [
          IconButton(
            onPressed: () {
              // Implement search functionality
            },
            icon: const Icon(
              Icons.search,
              color: bgColour,
            ),
          ),
        ],
        leading:Builder(
    builder: (BuildContext context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer(); // Open the drawer
        },
        icon: const Icon(
          Icons.sort_rounded,
          color: bgColour,
        ),
      );
    },
  ),
        title: Text(
          "Vibes", // Use a dynamic title or retrieve it from a configuration
          style: ourStyle(size: 18),
        ),
      ),
      body: FutureBuilder<List<SongModel>>(
        future: controller.audiQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL,
        ),
        
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text(
                "Error loading songs",
                style: ourStyle(),
              ),
            );
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No songs found",
                style: ourStyle(),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Obx(
                      () => ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        tileColor: bgColour,
                        title: Text(
                          "${snapshot.data![index].displayNameWOExt}",
                          style: ourStyle(size: 15),
                        ),
                        subtitle: Text(
                          "${snapshot.data![index].artist}",
                          style: ourStyle(size: 12),
                        ),
                        leading: QueryArtworkWidget(
                          id: snapshot.data![index].id,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: const Icon(
                            Icons.music_note,
                            color: whiteColour,
                            size: 32,
                          ),
                        ),
                        trailing: controller.playIndex.value == index &&
                                controller.isplaying.value
                            ? const Icon(
                                Icons.play_arrow,
                                color: whiteColour,
                                size: 26,
                              )
                            : null,
                        onTap: () {
                          Get.to(() => Player(data: snapshot.data!,)
                          ,
                          transition: Transition.downToUp);
                          controller.playSong(snapshot.data![index].uri,index);
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
           drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Upload Song'),
              onTap: () {
                // Navigate to the upload screen
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
