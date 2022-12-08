import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EventosProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getEventos() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/eventos'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> agregar(String id_evento,
      String nombre_evento, String estado_evento, int entradas_vendidas) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/eventos'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'id_evento': id_evento,
        'nombre_evento': nombre_evento,
        'estado_evento': estado_evento,
        'entradas_vendidas': entradas_vendidas,
      }),
    );

    return json.decode(respuesta.body);
  }

  //borrar producto
  Future<bool> borrar(String id_evento) async {
    var respuesta =
        await http.delete(Uri.parse(apiURL + '/eventos/' + id_evento));
    return respuesta.statusCode == 200;
  }

  //retorna los datos de 1 producto en particular
  Future<LinkedHashMap<String, dynamic>> getEvento(String id_evento) async {
    var respuesta = await http.get(Uri.parse(apiURL + '/eventos/' + id_evento));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> editar(
      String id_evento_actual,
      String id_evento_nuevo,
      String nombre_evento,
      String estado_evento,
      int entradas_vendidas) async {
    var respuesta = await http.put(
      Uri.parse(apiURL + '/eventos/' + id_evento_actual),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'id_evento_viejo': id_evento_actual,
        'id_evento': id_evento_nuevo,
        'nombre_evento': nombre_evento,
        'estado_evento': estado_evento,
        'entradas_vendidas': entradas_vendidas,
      }),
    );

    return json.decode(respuesta.body);
  }
}
