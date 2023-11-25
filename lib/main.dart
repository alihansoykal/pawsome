import 'package:flutter/material.dart';

void main() {
  runApp(const PawsomeApp());
}

class PawsomeApp extends StatelessWidget {
  const PawsomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
    );
  }
}
