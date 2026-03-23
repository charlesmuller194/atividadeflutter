import 'package:flutter/material.dart';

import '../../../domain/entities/rodada.dart';
import '../../../domain/usecases/jogar_usecase.dart';
import '../../theme/app_theme.dart';
import '../../utils/jogada_assets.dart';
import '../../widgets/circulo_jogada.dart';

/// Tela de resultado: exibe as escolhas e o desfecho da rodada.
class ResultScreen extends StatelessWidget {
  final Rodada rodada;
  final JogarUseCase jogarUseCase;

  const ResultScreen({
    super.key,
    required this.rodada,
    required this.jogarUseCase,
  });

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
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Escolha do APP
            const Text(
              'Escolha do APP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            CirculoJogada(
              tamanho: 130,
              imagem: JogadaAssets.deJogada(rodada.escolhaApp),
            ),
            const SizedBox(height: 20),

            // Escolha do usuário
            const Text(
              'Sua Escolha',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            CirculoJogada(
              tamanho: 130,
              imagem: JogadaAssets.deJogada(rodada.escolhaUsuario),
            ),
            const SizedBox(height: 20),

            // Imagem do resultado
            Image.asset(
              JogadaAssets.deResultado(rodada.resultado),
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              JogadaAssets.textoDeResultado(rodada.resultado),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 24),

            // Botão "Jogar novamente"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.vermelho,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Jogar novamente',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
