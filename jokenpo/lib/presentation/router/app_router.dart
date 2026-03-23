import 'package:flutter/material.dart';

import '../../domain/entities/rodada.dart';
import '../../domain/usecases/jogar_usecase.dart';
import '../screens/home/home_screen.dart';
import '../screens/result/result_screen.dart';

class AppRouter {
  final JogarUseCase jogarUseCase;

  AppRouter({required this.jogarUseCase});

  static const String home = '/';
  static const String result = '/result';

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
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(jogarUseCase: jogarUseCase),
        );
    }
  }
}
