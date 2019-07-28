import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(SpyApp());

class SpyApp extends StatelessWidget {
  const SpyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}