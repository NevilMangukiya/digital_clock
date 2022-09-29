import 'dart:async';
import 'dart:math';

import 'package:adv_viva_test_1/screens/clock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => DigitalClock(),
      },
    ),
  );
}
