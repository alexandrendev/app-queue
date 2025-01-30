import 'package:flutter/material.dart';

enum Prioridade {
  vermelho(1, 'Emergência'),
  laranja(2, 'Muito Urgente'),
  amarelo(3, 'Urgente'),
  verde(4, 'Pouco Urgente'),
  azul(5, 'Sem Urgência');

  final int valor;
  final String nome;

  const Prioridade(this.valor, this.nome);

  static Prioridade fromValor(int valor) {
    return Prioridade.values.firstWhere(
      (prioridade) => prioridade.valor == valor,
      orElse: () => Prioridade.azul,
    );
  }

  static Prioridade fromNome(String nome) {
    return Prioridade.values.firstWhere(
      (prioridade) => prioridade.nome.toLowerCase() == nome.toLowerCase(),
      orElse: () => Prioridade.azul, // Retorna azul se não encontrar
    );
  }

  static Color getColor(Prioridade prioridade) {
    switch (prioridade) {
      case Prioridade.vermelho:
        return Colors.red;
      case Prioridade.laranja:
        return Colors.orange;
      case Prioridade.amarelo:
        return Colors.yellow;
      case Prioridade.verde:
        return Colors.green;
      case Prioridade.azul:
        return Colors.blue;
    }
  }
}
