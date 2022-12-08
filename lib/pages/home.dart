import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_movil/constantes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:proyecto_movil/auth_google.dart';

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
        actions: [
          Row(
            children: [
              Text(FirebaseAuth.instance.currentUser!.email!),
              ElevatedButton(
                  onPressed: () {
                    AuthService().signOut(context);
                  },
                  child: Icon(MdiIcons.exitRun)),
            ],
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  Future<String> getUserEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('userEmail') ?? '';
  }
}
