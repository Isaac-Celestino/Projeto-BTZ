import 'package:flutter/material.dart';
import '../models/equipamento.dart';
import '../services/db_service.dart';
import '../widgets/equipamento_item.dart';

class EquipamentosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Equipamentos')),
      body: FutureBuilder<List<Equipamento>>(
        future: DBService().getEquipamentos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Erro ao carregar equipamentos');
          }

          final equipamentos = snapshot.data!;
          return ListView.builder(
            itemCount: equipamentos.length,
            itemBuilder: (ctx, index) {
              return EquipamentoItem(equipamento: equipamentos[index]);
            },
          );
        },
      ),
    );
  }
}
