import 'package:flutter/material.dart';

import '../constantes.dart';

class BotonInicio extends StatelessWidget {
  const BotonInicio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Color(kBoton)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)
            ),),
          ),
        onPressed: (){},
        child: Text('Iniciar Sesion',style: kBodyText.copyWith(fontWeight: FontWeight.bold),),
      ),
    );
  }
}