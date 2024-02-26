import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vibes/models/song.dart';
import 'package:vibes/viewModel/player_controller.dart';
import 'package:vibes/views/home.dart';

void main() {
  testWidgets('Home Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: Home()),
      ),
    );

    // Wait for the FutureBuilder to load songs
    await tester.pumpAndSettle();

    // Verify that the CircularProgressIndicator is not present
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Verify that the loaded songs are displayed
    expect(find.byType(ListTile), findsWidgets);

    // Tap on the first song in the list
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();

    // Verify that the Player screen is pushed
    expect(find.text('Player'), findsOneWidget);
  });
}
