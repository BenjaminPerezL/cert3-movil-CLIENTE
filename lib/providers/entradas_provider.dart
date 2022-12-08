import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EntradasProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getEntradas() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/entradas'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> agregar(String numero_entrada,
      String nombre_cliente, String informacion_evento, String evento_id,String mail) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/entradas'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'numero_entrada': numero_entrada,
        'nombre_cliente': nombre_cliente,
        'informacion_evento': informacion_evento,
        'evento_id': evento_id,
        'mail' : mail,
      }),
    );

    return json.decode(respuesta.body);
  }

  //borrar producto
  Future<bool> borrar(String numero_entrada)async {
    var respuesta =
        await http.delete(Uri.parse(apiURL + '/entradas/' + numero_entrada));
    return respuesta.statusCode == 200;
  }

  //retorna los datos de 1 producto en particular
  Future<LinkedHashMap<String, dynamic>> getEvento(
      String numero_entrada) async {
    var respuesta =
        await http.get(Uri.parse(apiURL + '/entradas/' + numero_entrada));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> editar(String numero_entrada,String numero_entrada_nuevo,
      String nombre_cliente, String informacion_evento, int evento_id,String mail) async {
    var respuesta = await http.put(
      Uri.parse(apiURL + '/entradas/' + numero_entrada),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'numero_entrada': numero_entrada_nuevo,
        'nombre_cliente': nombre_cliente,
        'informacion_evento': informacion_evento,
        'evento_id': evento_id,
        'mail' : mail,
      }),
    );

    return json.decode(respuesta.body);
  }
}
