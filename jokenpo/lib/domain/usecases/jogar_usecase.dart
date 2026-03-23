import '../entities/jogada.dart';
import '../entities/rodada.dart';
import '../repositories/jogo_repository.dart';

class JogarUseCase {
  final JogoRepository _repository;

  const JogarUseCase(this._repository);

  Rodada call(Jogada escolhaUsuario) => _repository.jogar(escolhaUsuario);
}
