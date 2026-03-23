import 'package:flutter/material.dart';

/// Paleta de cores e ThemeData centralizados.
abstract final class AppTheme {
  static const vermelho = Color(0xFFF44336);
  static const fundoCinza = Color(0xFFF5F5F5);

  static ThemeData get theme => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: vermelho),
    useMaterial3: true,
  );
}
