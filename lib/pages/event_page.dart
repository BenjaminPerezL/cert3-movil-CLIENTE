import 'package:flutter/material.dart';

import '../constantes.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola', style: kAppBarText,),
        backgroundColor: Color(kAppBar),
      ),
      backgroundColor: Color(kBackground2),
      body: Center(
        child: Text('Detalle del Evento', style: TextStyle(fontSize: 40),),
      ),
    );
  }
}