import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_movil/pages/admin/admin_agregar_noticia.dart';

import '../../services/firestore_service.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({super.key});

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  IconData icono = MdiIcons.cube;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
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
                trailing: OutlinedButton(
                  child: Text('Borrar'),
                  onPressed: () {
                    FirestoreService().borrar(noticia.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: ((context) => AgregarNoticia()));
          Navigator.push(context, route);
        },
      ),
    );
  }
}
