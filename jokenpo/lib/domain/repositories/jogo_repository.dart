import '../entities/jogada.dart';
import '../entities/rodada.dart';

/// Contrato que define como o jogo deve ser executado.
/// A camada de domínio depende apenas desta abstração.
abstract interface class JogoRepository {
  /// Recebe a [escolhaUsuario], gera a jogada do APP aleatoriamente
  /// e retorna a [Rodada] com o resultado calculado.
  Rodada jogar(Jogada escolhaUsuario);
}
