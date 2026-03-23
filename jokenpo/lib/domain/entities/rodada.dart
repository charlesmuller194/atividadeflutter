import 'jogada.dart';
import 'resultado.dart';

class Rodada {
  final Jogada escolhaUsuario;
  final Jogada escolhaApp;
  final Resultado resultado;

  const Rodada({
    required this.escolhaUsuario,
    required this.escolhaApp,
    required this.resultado,
  });
}
