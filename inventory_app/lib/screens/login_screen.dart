import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    try {
      await AuthService()
          .login(_emailController.text, _passwordController.text);
      Navigator.pushReplacementNamed(context, '/equipamentos');
    } catch (e) {
      print("Erro de login: $e");
      // Exibir mensagem de erro
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: [
          TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email')),
          TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true),
          ElevatedButton(onPressed: _login, child: Text('Entrar')),
        ],
      ),
    );
  }
}
