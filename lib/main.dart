import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
          enabled: !kReleaseMode, // Ensures that it is disabled in release mode
          builder: (context) => XylophoneApp()),
    );

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder, // <--- Add the builder
      title: "XyloPhone",
      theme:
          ThemeData(brightness: Brightness.dark), //use to make status bar dark
      home: Scaffold(
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(Colors.red, 1),
            buildKey(Colors.orange, 2),
            buildKey(Colors.yellow, 3),
            buildKey(Colors.green, 4),
            buildKey(Colors.teal, 5),
            buildKey(Colors.blue, 6),
            buildKey(Colors.purple, 7),
          ],
        )),
      ),
    );
  }

  void playSound(int number) {
    final AudioCache player = AudioCache();
    player.play("note$number.wav");
  }

  Widget buildKey(Color color, int number) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(number);
        },
      ),
    );
  }
}
