class Equipamento {
  final String id;
  final String nome;
  final String codigo;
  DateTime ultimaData; // Removido o 'final' para permitir a alteração da data

  Equipamento({
    required this.id,
    required this.nome,
    required this.codigo,
    required this.ultimaData,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'codigo': codigo,
      'ultima_data': ultimaData.toIso8601String(),
    };
  }

  factory Equipamento.fromMap(Map<String, dynamic> map) {
    return Equipamento(
      id: map['id'],
      nome: map['nome'],
      codigo: map['codigo'],
      ultimaData: DateTime.parse(map['ultima_data']),
    );
  }

  bool isInventoryValid() {
    final thirtyDaysAgo = DateTime.now().subtract(Duration(days: 30));
    return ultimaData.isAfter(thirtyDaysAgo);
  }
}
