import 'package:flutter/material.dart';

import '../constantes.dart';

class FormularioEmail extends StatelessWidget {
  const FormularioEmail({Key? key, required this.icon, required this.text, this.inputType, this.inputAction,}) : super(key: key);

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
              TextFormField(decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(icon, size: 28,color: Color(kIcon),),
                ),
                hintText: text,
                hintStyle: kBodyText,
              ),
              style: kBodyText,
              keyboardType: inputType,
              textInputAction: inputAction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
