import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  static final id = '/details';
  Details({Key key}) : super(key: key);

  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(),
      ),
    );
  }
}
