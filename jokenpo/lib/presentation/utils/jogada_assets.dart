import '../../domain/entities/jogada.dart';
import '../../domain/entities/resultado.dart';

/// Mapeia entidades de domínio para caminhos de assets.
abstract final class JogadaAssets {
  static const _base = 'lib/assets';

  static String deJogada(Jogada jogada) => switch (jogada) {
    Jogada.pedra => '$_base/pedra.png',
    Jogada.papel => '$_base/papel.png',
    Jogada.tesoura => '$_base/tesoura.png',
  };

  static String deResultado(Resultado resultado) => switch (resultado) {
    Resultado.vitoria => '$_base/icons8-vitória-48.png',
    Resultado.derrota => '$_base/icons8-perder-48.png',
    Resultado.empate => '$_base/icons8-aperto-de-mãos-100.png',
  };

  static String textoDeResultado(Resultado resultado) => switch (resultado) {
    Resultado.vitoria => 'Você Venceu!',
    Resultado.derrota => 'Você Perdeu!',
    Resultado.empate => 'Empate!',
  };

  static const padrao = '$_base/padrao.png';
}
