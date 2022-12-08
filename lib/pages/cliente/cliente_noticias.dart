import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../services/firestore_service.dart';

class ClienteNoticias extends StatefulWidget {
  const ClienteNoticias({super.key});

  @override
  State<ClienteNoticias> createState() => _ClienteNoticiasState();
}

class _ClienteNoticiasState extends State<ClienteNoticias> {
  IconData icono = MdiIcons.cube;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirestoreService().listarNoticias(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noticia = snapshot.data!.docs[index];
              if (noticia['tipo'] == 1) {
                icono = MdiIcons.newspaperVariant;
              } else {
                icono = MdiIcons.stadium;
              }
              //print('PRODUCTO:' + producto.data().toString());
              return ListTile(
                leading: Icon(
                  icono,
                  color: Colors.deepPurple,
                ),
                title: Text(noticia['titulo_noticia']),
                subtitle: Text(noticia['cuerpo_noticia']),
              );
            },
          );
        },
      ),
    );
  }
}
