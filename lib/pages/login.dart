import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/boton_iniciar.dart';
import '../widgets/form_email.dart';
import '../widgets/form_passw.dart';
import '../widgets/imagen_fondo.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImagenFondo(
          imagen: 'assets/images/descarga.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black.withOpacity(0.6),
            ),
            child: Column(
              children: [
                Flexible(
                  child: Center(
                      child: Image.asset(
                    'assets/images/alce.png',
                    height: 150,
                    width: 250,
                  )),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 28.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Inicio de Sesión',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    FormularioEmail(
                      icon: MdiIcons.email,
                      text: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    FormularioPassword(
                      icon: MdiIcons.lockOutline,
                      text: 'Contraseña',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BotonInicio(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '-Inicia Sesion Con-',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent),
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent),
                      child: Image.asset(
                        'assets/images/facebook.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent),
                      child: Image.asset(
                        'assets/images/twitter.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
