import 'package:flutter/material.dart';
import 'package:FARTS/campaignview/add_load_campaign_view.dart';

// relevant pages
import 'package:FARTS/selectmodepage.dart';

Widget _currentPage =
    SelectModePage(); // linter says name non-constant identifiers with camel case :(

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _currentPage;
  }
}

navigate() {
  _currentPage = GameMaster();
}
