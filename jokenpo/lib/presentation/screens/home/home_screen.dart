import 'package:flutter/material.dart';

import '../../../domain/entities/jogada.dart';
import '../../../domain/usecases/jogar_usecase.dart';
import '../../theme/app_theme.dart';
import '../../utils/jogada_assets.dart';
import '../../widgets/circulo_jogada.dart';
import '../result/result_screen.dart';

/// Tela inicial: exibe o placeholder do APP e os botões de escolha do usuário.
class HomeScreen extends StatelessWidget {
  final JogarUseCase jogarUseCase;

  const HomeScreen({super.key, required this.jogarUseCase});

  void _onEscolha(BuildContext context, Jogada escolha) {
    final rodada = jogarUseCase(escolha);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            ResultScreen(rodada: rodada, jogarUseCase: jogarUseCase),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.vermelho,
        title: const Text(
          'Pedra, Papel, Tesoura',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Escolha do APP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            const CirculoJogada(tamanho: 140, imagem: JogadaAssets.padrao),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: Jogada.values.map((jogada) {
                return GestureDetector(
                  onTap: () => _onEscolha(context, jogada),
                  child: CirculoJogada(
                    tamanho: 90,
                    imagem: JogadaAssets.deJogada(jogada),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
