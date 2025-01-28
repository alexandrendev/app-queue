import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(
        0xFFF5F5F5), // Cinza muito claro para evitar branco puro (melhor conforto visual)
    primary: Color(0xFFD32F2F), // Vermelho forte, mas não muito saturado
    secondary: Color(0xFFFFCDD2), // Vermelho claro para detalhes sutis
    inversePrimary: Colors.white, // Melhor para contraste reverso
    onPrimary: Colors.white, // Mantém alta legibilidade sobre a cor principal
    onSecondary: Colors.black, // Garante bom contraste sobre cor secundária
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.black, // Garante boa leitura
        displayColor: Colors.grey
            .shade800, // Cinza escuro para melhor suavidade em textos grandes
      ),
  iconTheme: IconThemeData(
    color: Color(0xFFD32F2F), // Ícones em vermelho forte para destaque
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor:
        Color(0xFFD32F2F), // Vermelho primário para destaque nos itens ativos
    unselectedItemColor: Colors
        .grey.shade600, // Cinza médio para melhor distinção entre ativo/inativo
    backgroundColor: Color(0xFFFFFFFF), // Mantém branco para um visual limpo
  ),
);
