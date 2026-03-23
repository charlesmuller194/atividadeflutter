import 'dart:math';

import '../../domain/entities/jogada.dart';
import '../../domain/entities/resultado.dart';
import '../../domain/entities/rodada.dart';
import '../../domain/repositories/jogo_repository.dart';

class JogoRepositoryImpl implements JogoRepository {
  final _random = Random();

  @override
  Rodada jogar(Jogada escolhaUsuario) {
    final escolhaApp = Jogada.values[_random.nextInt(Jogada.values.length)];
    final resultado = _determinarResultado(escolhaUsuario, escolhaApp);

    return Rodada(
      escolhaUsuario: escolhaUsuario,
      escolhaApp: escolhaApp,
      resultado: resultado,
    );
  }

  Resultado _determinarResultado(Jogada usuario, Jogada app) {
    if (usuario == app) return Resultado.empate;

    const vitorias = {
      Jogada.pedra: Jogada.tesoura,
      Jogada.papel: Jogada.pedra,
      Jogada.tesoura: Jogada.papel,
    };

    return vitorias[usuario] == app ? Resultado.vitoria : Resultado.derrota;
  }
}
