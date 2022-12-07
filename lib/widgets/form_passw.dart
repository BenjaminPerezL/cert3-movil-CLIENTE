import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constantes.dart';

class FormularioPass extends StatelessWidget {
  const FormularioPass({
    Key? key,
    required this.passwordCtrl,
  }) : super(key: key);

  final TextEditingController passwordCtrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.07,
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
                controller: passwordCtrl,
                obscureText: true,
                style: kBodyText,
                keyboardType: TextInputType.name,
                //textInputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
