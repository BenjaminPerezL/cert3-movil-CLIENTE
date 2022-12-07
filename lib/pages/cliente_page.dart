import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../auth.dart';
import '../constantes.dart';
import '../widgets/events.dart';
import 'event_page.dart';

class Cliente_Home extends StatefulWidget {
  const Cliente_Home({super.key});

  @override
  State<Cliente_Home> createState() => _Cliente_HomeState();
}

class _Cliente_HomeState extends State<Cliente_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kBackgroundColor),
        title: Text('Cliente Page'),
        actions: [
          Row(
            children: [
              Text(FirebaseAuth.instance.currentUser!.email!),
              ElevatedButton(
                  onPressed: () {
                    AuthService().signOut();
                  },
                  child: Icon(MdiIcons.exitRun)),
            ],
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: ListView(
          itemExtent: 350,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Events(
                imagen: 'assets/images/pluma.jpg',
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: ((context) => EventPage()));
                  Navigator.push(context, route);
                }),
            Events(
                imagen: 'assets/images/bird.jpg',
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: ((context) => EventPage()));
                  Navigator.push(context, route);
                }),
            Events(
                imagen: 'assets/images/Woman.jpg',
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: ((context) => EventPage()));
                  Navigator.push(context, route);
                }),
          ]),
    );
  }
}
