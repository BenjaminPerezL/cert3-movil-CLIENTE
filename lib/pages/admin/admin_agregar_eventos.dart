import 'package:flutter/material.dart';
import 'package:proyecto_movil/providers/eventos_provider.dart';

class EventosAgregarPage extends StatefulWidget {
  @override
  State<EventosAgregarPage> createState() => _EventosAgregarPageState();
}

class _EventosAgregarPageState extends State<EventosAgregarPage> {
  TextEditingController id_eventoCtrl = TextEditingController();
  TextEditingController nombre_eventoCtrl = TextEditingController();
  TextEditingController estado_eventoCtrl = TextEditingController();
  var _lista = ['Finalizado', 'Proximo'];
  String errId_evento = '';
  String errNombre_evento = '';
  String errEstado_evento = '';
  String _vista = 'Proximo';

  int categoriaSeleccionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              campoId_eventos(),
              mostrarError(errId_evento),
              campoNombre_evento(),
              mostrarError(errNombre_evento),
              campoEstado_evento(),
              mostrarError(errEstado_evento),
              botonAgregar(),
            ],
          ),
        ),
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

  Container botonAgregar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.purple,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text('Agregar Producto'),
          ],
        ),
        onPressed: () async {
          //caputar datos del form
          String id_evento = id_eventoCtrl.text.trim();
          String nombre_evento = nombre_eventoCtrl.text.trim();
          String estado_evento = _vista;
          int entradas_vendidas = 0;

          //enviar por post al api
          var respuesta = await EventosProvider().agregar(
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

          //redireccionar a pagina que lista productos
          Navigator.pop(context);
        },
      ),
    );
  }
}
