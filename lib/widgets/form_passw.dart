import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constantes.dart';

class FormularioPassword extends StatefulWidget {
  TextEditingController passwordCtrl;

  FormularioPassword(
    this.passwordCtrl, {
    Key? key,
    required this.icon,
    required this.text,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

  @override
  State<FormularioPassword> createState() => _FormularioPasswordState();
}

class _FormularioPasswordState extends State<FormularioPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      MdiIcons.lockOutline,
                      size: 28,
                      color: Color(kIcon),
                    ),
                  ),
                  hintText: 'Contraseña',
                  hintStyle: kBodyText,
                ),
                //controller: passwordCtrl,
                obscureText: true,
                style: kBodyText,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
