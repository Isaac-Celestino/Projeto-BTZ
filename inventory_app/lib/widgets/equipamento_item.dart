// widgets/equipamento_item.dart

import 'package:flutter/material.dart';
import '../modelos/equipamento.dart';

class EquipamentoItem extends StatelessWidget {
  final Equipamento equipamento;

  EquipamentoItem({required this.equipamento});

  @override
  Widget build(BuildContext context) {
    final isValid = equipamento.isInventoryValid(); // Verifica se o inventário é válido
    return ListTile(
      title: Text(equipamento.nome),
      subtitle: Text('Código: ${equipamento.codigo}\nÚltimo Inventário: ${equipamento.ultimaData.toLocal()}'),
      trailing: IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          // Aqui você pode implementar o botão para atualizar o inventário
        },
      ),
      tileColor: isValid ? Colors.green[100] : Colors.red[100], // Muda a cor dependendo da validade
      contentPadding: EdgeInsets.all(8.0),
    );
  }
}
