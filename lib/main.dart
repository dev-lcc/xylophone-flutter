import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final audioPlayer = AudioCache();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shiela Marie's Xylophone 😘"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: colorSet.map((e) {
                int index = colorSet.indexOf(e);
                return xylophoneKey(index, () {
                  audioPlayer.play("note${index + 1}.wav");
                });
              }).toList(),
            ),
          ),
        ),
      )
    );
  }
}

const colorSet = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.pink,
  Colors.indigo,
  Colors.yellow,
  Colors.teal,
];

Widget xylophoneKey(int index, Function onPressed) {
  return Expanded(
    child: Row(
      // mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: TextButton(
            child: Text(
                "Key #${index + 1}",
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(colorSet[index]),
            ),
            onPressed: onPressed,
          ),
        )
      ],
    ),
  );
}
