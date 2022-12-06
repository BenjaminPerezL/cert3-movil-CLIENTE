import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constantes.dart';

class FormularioEmail extends StatelessWidget {
  TextEditingController emailCtrl;
  FormularioEmail(this.emailCtrl,
      {Key? key,
      required this.icon,
      required this.text,
      this.inputType,
      this.inputAction})
      : super(key: key);

  final IconData icon;
  final String text;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

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
                      MdiIcons.email,
                      size: 28,
                      color: Color(kIcon),
                    ),
                  ),
                  hintText: 'Email',
                  hintStyle: kBodyText,
                ),
                style: kBodyText,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
