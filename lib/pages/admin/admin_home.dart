import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_movil/pages/admin/admin_listar_eventos.dart';
import 'package:proyecto_movil/pages/admin/admin_noticias.dart';
import 'package:proyecto_movil/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth_google.dart';
import '../../constantes.dart';
import '../../widgets/events.dart';
import '../event_page.dart';

class Admin_Home extends StatefulWidget {
  const Admin_Home({super.key});

  @override
  State<Admin_Home> createState() => _Admin_HomeState();
}

class _Admin_HomeState extends State<Admin_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kBackgroundColor),
        title: Text('Admin a Page'),
        actions: [
          Row(
            children: [
              Text(FirebaseAuth.instance.currentUser!.email!),
              ElevatedButton(
                  onPressed: () {
                    AuthService().signOut(context);
                    //logout(context);
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
                titulo: 'Eventos',
                imagen: 'assets/images/pluma.jpg',
                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: ((context) => EventosAdminListarPage()));
                  Navigator.push(context, route);
                }),
            Events(
                titulo: 'Noticias',
                imagen: 'assets/images/bird.jpg',
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: ((context) => NoticiasPage()));
                  Navigator.push(context, route);
                }),
          ]),
    );
  }

  void logout(BuildContext context) async {
    //cerrar sesion en firebase
    await FirebaseAuth.instance.signOut();

    //borrar user email de shared preferences
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('userEmail');

    //redirigir al login
    MaterialPageRoute route =
        MaterialPageRoute(builder: ((context) => Login()));
    Navigator.pushReplacement(context, route);
  }
}
