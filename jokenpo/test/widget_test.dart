import 'package:flutter_test/flutter_test.dart';

import 'package:jokenpo/data/repositories/jogo_repository_impl.dart';
import 'package:jokenpo/domain/usecases/jogar_usecase.dart';
import 'package:jokenpo/main.dart';

void main() {
  testWidgets('Tela inicial exibe "Escolha do APP"', (
    WidgetTester tester,
  ) async {
    final jogarUseCase = JogarUseCase(JogoRepositoryImpl());

    await tester.pumpWidget(MyApp(jogarUseCase: jogarUseCase));

    expect(find.text('Escolha do APP'), findsOneWidget);
    expect(find.text('Pedra, Papel, Tesoura'), findsOneWidget);
  });
}
