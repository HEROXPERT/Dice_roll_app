import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer([ Color.fromARGB(255, 111, 207, 252), Color.fromARGB(153, 85, 139, 238)]),
      ),
    ),
  );
}


