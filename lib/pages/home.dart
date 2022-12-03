import 'package:flutter/material.dart';
import 'package:proyecto_movil/constantes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kBackgroundColor),
        title: Text('Home Page'),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
