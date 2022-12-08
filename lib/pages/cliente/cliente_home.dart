import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_movil/pages/cliente/cliente_noticias.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth_google.dart';
import '../../constantes.dart';
import '../../widgets/events.dart';
import '../event_page.dart';
import '../login.dart';

class Cliente_Home extends StatefulWidget {
  const Cliente_Home({super.key});

  @override
  State<Cliente_Home> createState() => _Cliente_HomeState();
}

class _Cliente_HomeState extends State<Cliente_Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(kBackgroundColor),
          title: Text('Cliente Page'),
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
          bottom: const TabBar(
            isScrollable: false,
            tabs: [
              Tab(
                icon: Icon(MdiIcons.ticketAccount),
                text: 'Mis tickets',
              ),
              Tab(
                icon: Icon(MdiIcons.newspaperVariantMultiple),
                text: 'Noticias',
              ),
              Tab(
                icon: Icon(MdiIcons.cart),
                text: 'Comprar Tickets',
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: TabBarView(
          children: [
            Icon(MdiIcons.ticketAccount),
            ClienteNoticias(),
            Icon(MdiIcons.cart)
          ],
        ),
      ),
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



// Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(kBackgroundColor),
//         title: Text('Cliente Page'),
//         actions: [
//           Row(
//             children: [
//               Text(FirebaseAuth.instance.currentUser!.email!),
//               ElevatedButton(
//                   onPressed: () {
//                     AuthService().signOut();
//                   },
//                   child: Icon(MdiIcons.exitRun)),
//             ],
//           )
//         ],
//       ),
//       backgroundColor: Colors.grey[200],
//       body: ListView(
//           itemExtent: 250,
//           physics: const BouncingScrollPhysics(),
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           children: [
//             Events(
//                 titulo: 'Comprar',
//                 imagen: 'assets/images/pluma.jpg',
//                 onPressed: () {
//                   MaterialPageRoute route =
//                       MaterialPageRoute(builder: ((context) => EventPage()));
//                   Navigator.push(context, route);
//                 }),
//             Events(
//                 titulo: 'Noticias',
//                 imagen: 'assets/images/bird.jpg',
//                 onPressed: () {
//                   MaterialPageRoute route = MaterialPageRoute(
//                       builder: ((context) => ClienteNoticias()));
//                   Navigator.push(context, route);
//                 }),
//             Events(
//                 titulo: 'Mis tickets',
//                 imagen: 'assets/images/Woman.jpg',
//                 onPressed: () {
//                   MaterialPageRoute route =
//                       MaterialPageRoute(builder: ((context) => EventPage()));
//                   Navigator.push(context, route);
//                 }),
//           ]),
//     )