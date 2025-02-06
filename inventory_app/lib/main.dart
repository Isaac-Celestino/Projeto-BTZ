import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/equipamentos_screen.dart';
import 'services/auth_service.dart';

void main() {
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
      home: const LoginScreen(), // Tela de login como inicial
      routes: {
        '/equipamentos': (context) =>
            const EquipamentosScreen(), // Navegação para a tela de equipamentos
      },
    );
  }
}
