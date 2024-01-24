import 'package:flutter/material.dart';
import 'package:vibes/constant/colours.dart';
import 'package:vibes/constant/text_style.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColour,
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
            child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: Icon(Icons.music_note),
        )),
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
          child: Column(children: [
            Text(
              "Music name",
              style: ourStyle(color: bgdarkColour, size: 24),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Artist name",
              style: ourStyle(color: bgdarkColour, size: 20),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  "0:0",
                  style: ourStyle(color: bgColour),
                ),
                Expanded(
                    child: Slider(
                        thumbColor: slideColour,
                        inactiveColor: bgColour,
                        activeColor: slideColour,
                        value: 0.0,
                        onChanged: (newValue) {})),
                Text(
                  "04:00",
                  style: ourStyle(color: bgColour),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      size: 40,
                      color: bgdarkColour,
                    )),
                CircleAvatar(
                    radius: 35,
                    backgroundColor: bgdarkColour,
                    child: Transform.scale(
                        scale: 2.5,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow_rounded,color: whiteColour,)))),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_next_rounded, size: 40,color: bgdarkColour,)),
              ],
            )
          ]),
        ))
      ]),
    );
  }
}
