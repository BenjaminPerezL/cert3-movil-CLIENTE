//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_movil/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constantes.dart';

class BotonInicio extends StatefulWidget {
  String error;
  TextEditingController passwordCtrl;
  TextEditingController emailCtrl;
  BotonInicio(this.error, this.passwordCtrl, this.emailCtrl, {Key? key})
      : super(key: key);

  @override
  State<BotonInicio> createState() => _BotonInicioState();
}

class _BotonInicioState extends State<BotonInicio> {
  String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Color(kBoton)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
        ),
        onPressed: () {
          print(widget.emailCtrl.text.trim().toString());
          print("hola");
        },
        // onPressed: () => login(),
        child: Text(
          'Iniciar Sesion',
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void login() async {
    try {
      //Intentar login

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: widget.emailCtrl.text.trim(),
        password: widget.passwordCtrl.text.trim(),
      );

      //CREDENCIALES OK
      //guardar email

      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('userEmail', userCredential.user!.email.toString());

      //redirigir al home
      MaterialPageRoute route = MaterialPageRoute(
        builder: (context) => HomePage(),
      );
      Navigator.pushReplacement(context, route);
    } on FirebaseAuthException catch (ex) {
      //CASO DE LOGIN NO VALIDO
      switch (ex.code) {
        case 'user-not-found':
          error = 'Usuario no existe';
          break;
        case 'wrong-password':
          error = 'Contraseña incorrecta';
          break;
        case 'user-disabled':
          error = 'Cuenta desactivada';
          break;
        default:
          error = ex.message.toString();
          break;
      }
      setState(() {});
    }
  }
}
