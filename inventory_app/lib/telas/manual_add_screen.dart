import 'package:flutter/material.dart';
import '../modelos/equipamento.dart';  // Certifique-se de importar seu modelo Equipamento
import '../servicos/db_service.dart';  // Certifique-se de importar o DBService

class ManualAddScreen extends StatefulWidget {
  @override
  _ManualAddScreenState createState() => _ManualAddScreenState();
}

class _ManualAddScreenState extends State<ManualAddScreen> {
  final _nomeController = TextEditingController();
  final _codigoController = TextEditingController();

  void _saveEquipamento() {
    final nome = _nomeController.text;
    final codigo = _codigoController.text;

    if (nome.isEmpty || codigo.isEmpty) {
      return;
    }

    final equipamento = Equipamento(
      id: DateTime.now().toString(), // Usando a data como ID temporário
      nome: nome,
      codigo: codigo,
      ultimaData: DateTime.now(),
    );

    DBService().insertEquipamento(equipamento); // Inserindo no banco de dados

    Navigator.pop(context); // Volta para a tela de equipamentos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Equipamento Manualmente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Equipamento'),
            ),
            TextField(
              controller: _codigoController,
              decoration: InputDecoration(labelText: 'Código do Equipamento'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveEquipamento,
              child: Text('Salvar Equipamento'),
            ),
          ],
        ),
      ),
    );
  }
}
