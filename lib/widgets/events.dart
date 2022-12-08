import 'package:flutter/material.dart';

import '../constantes.dart';

class Events extends StatelessWidget {
  const Events({
    Key? key,
    required this.titulo,
    required this.imagen,
    required this.onPressed,
  }) : super(key: key);
  final String titulo;
  final String imagen;
  final VoidCallback onPressed;
  //final VoidCallback? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      //onLongPress: onLongPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 5),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: AssetImage(imagen),
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black26, BlendMode.darken))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              titulo,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Color(kTitulo1),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Estado',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
