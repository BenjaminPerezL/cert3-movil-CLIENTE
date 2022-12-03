import 'package:flutter/material.dart';
class ImagenFondo extends StatelessWidget {
  const ImagenFondo({
    Key? key,
    required this.imagen,
  }) : super(key: key);

  final String imagen;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [Colors.black, Colors.transparent],
      ).createShader(rect),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagen),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
          ),
        ),
      ),
    );
  }
}