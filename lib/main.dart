import 'package:flutter/material.dart';
import 'package:spy_app/details.dart';
import 'package:spy_app/setting_view.dart';

import 'home.dart';

void main() => runApp(SpyApp());

class SpyApp extends StatelessWidget {
  const SpyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Home(),
        routes: {
          Settings.id: (context) => Settings(),
          Details.id: (context) => Details(),
        },
      ),
    );
  }
}
