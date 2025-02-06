import 'package:flutter/material.dart';
import '../modelos/equipamento.dart';

class EquipamentoItem extends StatelessWidget {
  final Equipamento equipamento;

  EquipamentoItem({required this.equipamento});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(equipamento.nome),
      subtitle: Text('Código: ${equipamento.codigo}'),
      trailing: IconButton(
        icon: Icon(Icons.camera_alt),
        onPressed: () {
          // Lógica para iniciar o scanner de QR Code
        },
      ),
    );
  }
}
