import 'package:flutter/material.dart';

//Main Class
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//Stateful Class
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

//Page Widget
class PageBuild extends StatelessWidget {
  PageBuild({super.key, required this.title, required this.options});

  final String title;
  Map<String, String> options = {
    'page_projects': 'Projects',
    'page_configuration': 'Configuration',
    'page_train': 'Train',
    'page_report': 'Report',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(20));
  }
}
