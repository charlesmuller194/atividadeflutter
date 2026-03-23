import 'package:flutter/material.dart';

class CirculoJogada extends StatelessWidget {
  final double tamanho;
  final String imagem;

  const CirculoJogada({super.key, required this.tamanho, required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagem,
      width: tamanho,
      height: tamanho,
      fit: BoxFit.contain,
    );
  }
}
