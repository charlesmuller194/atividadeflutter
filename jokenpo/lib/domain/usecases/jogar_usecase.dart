import '../entities/jogada.dart';
import '../entities/rodada.dart';
import '../repositories/jogo_repository.dart';

/// Caso de uso: executa uma rodada do jogo.
/// Não conhece detalhes de implementação (Random, assets, UI).
class JogarUseCase {
  final JogoRepository _repository;

  const JogarUseCase(this._repository);

  Rodada call(Jogada escolhaUsuario) => _repository.jogar(escolhaUsuario);
}
