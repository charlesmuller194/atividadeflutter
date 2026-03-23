import 'package:flutter/material.dart';

import 'data/repositories/jogo_repository_impl.dart';
import 'domain/usecases/jogar_usecase.dart';
import 'presentation/router/app_router.dart';
import 'presentation/theme/app_theme.dart';

void main() {
  // Composição de dependências (Composition Root)
  final jogarUseCase = JogarUseCase(JogoRepositoryImpl());
  final router = AppRouter(jogarUseCase: jogarUseCase);

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final AppRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel, Tesoura',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppRouter.home,
      onGenerateRoute: router.onGenerateRoute,
    );
  }
}
