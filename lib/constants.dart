import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tik_tok_clone/view/screens/add_video.dart';
import 'package:tik_tok_clone/view/screens/display_screen.dart';

getRandomColor() => [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
    ][Random().nextInt(3)];

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageIndex = [
  // Text('Home'),
  DisplayVideoScreen(),
  Text('Search'),
  AddVideoScreen(),
  Text('Messages'),
  Text('Profile'),
];
