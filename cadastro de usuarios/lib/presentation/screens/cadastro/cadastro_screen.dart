import 'package:flutter/material.dart';

import '../confirmacao/confirmacao_screen.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final FocusNode _nomeFocus = FocusNode();
  final FocusNode _idadeFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();

  String? _sexoSelecionado;
  bool _aceitaTermos = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    _emailController.dispose();
    _nomeFocus.dispose();
    _idadeFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.red[700],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _validarENavegar() {
    final nome = _nomeController.text.trim();
    final idadeTexto = _idadeController.text.trim();
    final email = _emailController.text.trim();

    if (nome.isEmpty) {
      _mostrarErro('Nome é obrigatório.');
      return;
    }

    if (idadeTexto.isEmpty) {
      _mostrarErro('Idade é obrigatória.');
      return;
    }

    int idade;
    try {
      idade = int.parse(idadeTexto);
    } catch (_) {
      _mostrarErro('Idade deve ser um número válido.');
      return;
    }

    if (idade < 18) {
      _mostrarErro('Você deve ter pelo menos 18 anos.');
      return;
    }

    if (email.isEmpty) {
      _mostrarErro('Email é obrigatório.');
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      _mostrarErro('Email inválido. Deve conter "@" e ".".');
      return;
    }

    if (_sexoSelecionado == null) {
      _mostrarErro('Selecione o sexo.');
      return;
    }

    if (!_aceitaTermos) {
      _mostrarErro('Você deve aceitar os termos de uso.');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ConfirmacaoScreen(
          nome: nome,
          idade: idade,
          email: email,
          sexo: _sexoSelecionado!,
          aceitouTermos: _aceitaTermos,
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA),
      appBar: AppBar(
        title: const Text(
          'Cadastro de Usuário',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Preencha os campos abaixo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 24),

              // Nome
              TextField(
                controller: _nomeController,
                focusNode: _nomeFocus,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_idadeFocus),
                decoration: _inputDecoration('Nome', 'Digite seu nome completo'),
              ),
              const SizedBox(height: 16),

              // Idade
              TextField(
                controller: _idadeController,
                focusNode: _idadeFocus,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_emailFocus),
                decoration: _inputDecoration('Idade', 'Digite sua idade'),
              ),
              const SizedBox(height: 16),

              // Email
              TextField(
                controller: _emailController,
                focusNode: _emailFocus,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: _inputDecoration('Email', 'exemplo@email.com'),
              ),
              const SizedBox(height: 20),

              // Sexo
              DropdownButtonFormField<String>(
                value: _sexoSelecionado,
                decoration: InputDecoration(
                  labelText: 'Sexo',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                hint: const Text('Selecione o sexo'),
                items: const [
                  DropdownMenuItem(value: 'Masculino', child: Text('Masculino')),
                  DropdownMenuItem(value: 'Feminino', child: Text('Feminino')),
                  DropdownMenuItem(value: 'Outro', child: Text('Outro')),
                ],
                onChanged: (value) {
                  setState(() {
                    _sexoSelecionado = value;
                  });
                },
              ),
              const SizedBox(height: 12),

              // Checkbox — Termos de uso
              Row(
                children: [
                  Checkbox(
                    value: _aceitaTermos,
                    activeColor: Colors.blue[700],
                    onChanged: (value) {
                      setState(() {
                        _aceitaTermos = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'Aceito os termos de uso',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Botão Cadastrar
              ElevatedButton(
                onPressed: _validarENavegar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
