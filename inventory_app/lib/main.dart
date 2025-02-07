import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'telas/login_screen.dart';
import 'telas/equipamentos_screen.dart';
import 'telas/qr_scanner_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializando o Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Inicializando o Hive
  await Hive.initFlutter();
  await Hive.openBox('equipamentos'); // Abre a caixa para armazenar dados localmente

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
      home: LoginScreen(), // Tela inicial (LoginScreen)
      routes: {
        '/equipamentos': (context) => EquipamentosScreen(), // Tela de equipamentos
        '/qr_scanner': (context) => QRScannerScreen(), // Tela de escaneamento de QR Code
      },
    );
  }
}
