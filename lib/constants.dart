import 'dart:math';

import 'package:flutter/material.dart';

getRandomColor() => [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
    ][Random().nextInt(3)];

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

const pageIndex = [
  'Home',
  'Search',
  'Upload Video',
  'Messages',
  'Profile',
];
