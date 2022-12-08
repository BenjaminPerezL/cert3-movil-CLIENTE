import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_movil/constantes.dart';
import 'package:proyecto_movil/pages/cliente/cliente_noticias.dart';

import '../../auth_google.dart';

class ClienteGoogle extends StatefulWidget {
  const ClienteGoogle({super.key});

  @override
  State<ClienteGoogle> createState() => _ClienteGoogleState();
}

class _ClienteGoogleState extends State<ClienteGoogle> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(kBackgroundColor),
          title: Text('Cliente g Page'),
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
}
