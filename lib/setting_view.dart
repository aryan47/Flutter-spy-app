import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static final id = '/settings';
  Settings({Key key}) : super(key: key);

  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settting'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(title: Text('Ritesh')),Divider(),
            ListTile(title: Text('Ritesh')),Divider(),
            ListTile(title: Text('Ritesh')),Divider(),
            ListTile(title: Text('Ritesh')),Divider(),
            ListTile(title: Text('Ritesh')),
          ],
        ),
      ),
    );
  }
}
