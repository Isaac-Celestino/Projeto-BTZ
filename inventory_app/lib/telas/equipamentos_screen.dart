import 'package:flutter/material.dart';
import '../modelos/equipamento.dart' as modelo; // Prefixo adicionado
import '../servicos/db_service.dart';
import '../widgets/equipamento_item.dart';

class EquipamentosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamentos'),
      ),
      body: FutureBuilder<List<modelo.Equipamento>>(
        future: DBService().getEquipamentos(),
        builder: (context, snapshot) {
          // Se estiver aguardando dados, mostra o CircularProgressIndicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Se ocorreu algum erro ao carregar os dados
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar equipamentos'));
          }

          // Se os dados estiverem disponíveis, retorna a lista de equipamentos
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum equipamento encontrado'));
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
