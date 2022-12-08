import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/firestore_service.dart';

class AgregarNoticia extends StatefulWidget {
  const AgregarNoticia({super.key});

  @override
  State<AgregarNoticia> createState() => _AgregarNoticiaState();
}

class _AgregarNoticiaState extends State<AgregarNoticia> {
  final formKey = GlobalKey<FormState>();
  bool val = false;
  int icono = 0;
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController tituloCtrl = TextEditingController();
  TextEditingController cuerpoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Noticia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: codigoCtrl,
                decoration: InputDecoration(
                  label: Text('Código'),
                ),
              ),
              TextFormField(
                controller: tituloCtrl,
                decoration: InputDecoration(
                  label: Text('Titulo'),
                ),
              ),
              TextFormField(
                controller: cuerpoCtrl,
                decoration: InputDecoration(
                  label: Text('Cuerpo'),
                ),
              ),
              Row(
                children: [
                  Text('Noticia'),
                  CupertinoSwitch(
                    value: val,
                    onChanged: (value) {
                      if (value) {
                        setState(() {
                          val = true;
                          icono = 0;
                        });
                      } else {
                        setState(() {
                          val = false;
                          icono = 1;
                        });
                      }
                      print(icono);
                    },
                  ),
                  Text('Evento')
                ],
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  child: Text('Agregar Noticia'),
                  onPressed: () {
                    FirestoreService().agregar(
                      codigoCtrl.text.trim(),
                      tituloCtrl.text.trim(),
                      cuerpoCtrl.text.trim(),
                      icono,
                    );
                    print(icono);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
