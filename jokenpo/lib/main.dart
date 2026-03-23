import 'package:flutter/material.dart';

import 'data/repositories/jogo_repository_impl.dart';
import 'domain/usecases/jogar_usecase.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/theme/app_theme.dart';

void main() {
  // Composição de dependências (Composition Root)
  final jogarUseCase = JogarUseCase(JogoRepositoryImpl());

  runApp(MyApp(jogarUseCase: jogarUseCase));
}

class MyApp extends StatelessWidget {
  final JogarUseCase jogarUseCase;

  const MyApp({super.key, required this.jogarUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel, Tesoura',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: HomeScreen(jogarUseCase: jogarUseCase),
    );
  }
}
