import '../entities/jogada.dart';
import '../entities/rodada.dart';

abstract interface class JogoRepository {
  Rodada jogar(Jogada escolhaUsuario);
}
