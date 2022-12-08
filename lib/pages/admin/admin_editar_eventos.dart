import 'package:flutter/material.dart';
import 'package:proyecto_movil/providers/eventos_provider.dart';

// ignore: must_be_immutable
class EventosEditarPage extends StatefulWidget {
  String id_evento;
  EventosEditarPage(this.id_evento, {Key? key}) : super(key: key);

  @override
  State<EventosEditarPage> createState() => _EventosEditarPageState();
}

class _EventosEditarPageState extends State<EventosEditarPage> {
  TextEditingController id_eventoCtrl = TextEditingController();
  TextEditingController nombre_eventoCtrl = TextEditingController();
  int entradas_vendidasCtrl = 0;
  var _lista = ['Finalizado', 'Proximo'];
  String _vista = '';
  String errId_evento = '';
  String errNombre_evento = '';
  String errEstado_evento = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: EventosProvider().getEvento(widget.id_evento),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var evento = snapshot.data;
              id_eventoCtrl.text = evento['id_evento'];
              nombre_eventoCtrl.text = evento['nombre_evento'];
              _vista = evento['estado_evento'];
              entradas_vendidasCtrl = evento['entradas_vendidas'];
              return Form(
                child: Column(
                  children: [
                    Container(
                      child: Text('Editando Evento:' + widget.id_evento),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          campoId_eventos(),
                          mostrarError(errId_evento),
                          campoNombre_evento(),
                          mostrarError(errNombre_evento),
                          campoEstado_evento(),
                          mostrarError(errEstado_evento),
                          botonEditar(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Container mostrarError(String error) {
    return Container(
      width: double.infinity,
      child: Text(
        error,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  TextFormField campoId_eventos() {
    return TextFormField(
      controller: id_eventoCtrl,
      decoration: InputDecoration(
        labelText: 'id_evento',
      ),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField campoNombre_evento() {
    return TextFormField(
      controller: nombre_eventoCtrl,
      decoration: InputDecoration(
        labelText: 'Nombre_evento',
      ),
    );
  }

  DropdownButton<String> campoEstado_evento() {
    return DropdownButton(
      items: _lista.map((String a) {
        return DropdownMenuItem(value: a, child: Text(a));
      }).toList(),
      onChanged: (_value) => {
        setState(() {
          _vista = _value!;
        })
      },
      hint: Text(_vista),
    );
  }

  Container botonEditar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit),
            Text('Editar Producto'),
          ],
        ),
        onPressed: () async {
          //caputar datos del form
          String id_evento = id_eventoCtrl.text.trim();
          String nombre_evento = nombre_eventoCtrl.text.trim();
          String estado_evento = _vista;
          int entradas_vendidas = entradas_vendidasCtrl;
          //enviar por post al api
          var respuesta = await EventosProvider().editar(widget.id_evento,
              id_evento, nombre_evento, estado_evento, entradas_vendidas);

          //manejar errores
          if (respuesta['message'] != null) {
            var errores = respuesta['errors'];
            errId_evento =
                errores['id_evento'] != null ? errores['id_evento'][0] : '';
            errNombre_evento = errores['nombre_evento'] != null
                ? errores['nombre_evento'][0]
                : '';
            errEstado_evento = errores['estado_evento'] != null
                ? errores['estado_evento'][0]
                : '';
            setState(() {});
            return;
          }
          Navigator.pop(context);
        },
      ),
    );
  }
}
