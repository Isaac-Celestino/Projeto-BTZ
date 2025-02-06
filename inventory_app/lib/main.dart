import 'package:flutter/material.dart';
import 'telas/login_screen.dart';
import 'telas/equipamentos_screen.dart';
import 'servicos/auth_service.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Inventário',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(), // Tela de login como inicial
      routes: {
        '/equipamentos': (context) =>
            EquipamentosScreen(), // Navegação para a tela de equipamentos
      },
    );
  }
}
