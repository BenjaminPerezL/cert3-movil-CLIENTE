import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_movil/providers/eventos_provider.dart';
import 'package:proyecto_movil/pages/admin/admin_agregar_eventos.dart';
import 'package:proyecto_movil/pages/admin/admin_editar_eventos.dart';

class EventosAdminListarPage extends StatefulWidget {
  const EventosAdminListarPage({Key? key}) : super(key: key);

  @override
  State<EventosAdminListarPage> createState() => _EventosAdminListarPageState();
}

class _EventosAdminListarPageState extends State<EventosAdminListarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
      ),
      body: FutureBuilder(
        future: EventosProvider().getEventos(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1.3,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var evento = snapshot.data[index];
              return Slidable(
                //action panes
                startActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    //SLIDABLE BORRAR
                    SlidableAction(
                      onPressed: (context) {
                        confirmDialog(context, evento['nombre_evento'])
                            .then((confirma) {
                          if (confirma) {
                            // borrar
                            EventosProvider()
                                .borrar(evento['id_evento'])
                                .then((fueBorrado) {
                              if (fueBorrado) {
                                snapshot.data.removeAt(index);
                                setState(() {});
                                mostrarSnackbar(
                                    'Evento ${evento['nombre_evento']} borrado');
                              }
                            });
                          }
                        });
                      },
                      backgroundColor: Colors.red,
                      icon: MdiIcons.trashCan,
                      label: 'Borrar',
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    //SLIDABLE EDITAR
                    SlidableAction(
                      onPressed: (context) {
                        MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) =>
                              EventosEditarPage(evento['id_evento']),
                        );
                        Navigator.push(context, route).then((valor) {
                          setState(() {
                            MaterialPageRoute route = MaterialPageRoute(
                              builder: (context) => EventosAgregarPage(),
                            );
                            Navigator.push(context, route).then((value) {
                              setState(() {});
                            });
                          });
                        });
                      },
                      backgroundColor: Colors.purple,
                      icon: Icons.edit,
                      label: 'Editar',
                    ),
                  ],
                ),
                //ListTile
                child: ListTile(
                  leading: Icon(MdiIcons.cube),
                  title: Text('${evento['nombre_evento']}'),
                  subtitle: Text('Estado: ${evento['estado_evento']}'),
                  trailing:
                      Text('Entradas vendidas: ${evento['entradas_vendidas']}'),
                  onLongPress: () {
                    //editar
                  },
                ),
              );
            },
          );
          // ----fin future builder
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => EventosAgregarPage(),
          );
          Navigator.push(context, route).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }

  void mostrarSnackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(mensaje),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context, String evento) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmación de borrado'),
          content: Text('¿Confirma borrar el evento $evento?'),
          actions: [
            TextButton(
              child: Text('CANCELAR'),
              onPressed: () => Navigator.pop(context, false),
            ),
            ElevatedButton(
              child: Text('CONFIRMAR'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );
  }
}
