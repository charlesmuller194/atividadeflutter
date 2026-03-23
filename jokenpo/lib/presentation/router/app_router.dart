import 'package:flutter/material.dart';

import '../../domain/entities/rodada.dart';
import '../../domain/usecases/jogar_usecase.dart';
import '../screens/home/home_screen.dart';
import '../screens/result/result_screen.dart';

/// Gerencia todas as rotas nomeadas da aplicação.
/// Centraliza a criação de telas e injeção de dependências via navegação.
class AppRouter {
  final JogarUseCase jogarUseCase;

  AppRouter({required this.jogarUseCase});

  // Nomes das rotas
  static const String home = '/';
  static const String result = '/result';

  /// Gera a rota correspondente ao [RouteSettings] solicitado.
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(jogarUseCase: jogarUseCase),
        );

      case result:
        final rodada = settings.arguments as Rodada;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ResultScreen(
            rodada: rodada,
            jogarUseCase: jogarUseCase,
          ),
        );

      default:
        // Fallback para a tela inicial caso a rota não seja reconhecida
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(jogarUseCase: jogarUseCase),
        );
    }
  }
}
