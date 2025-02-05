class Equipamento {
  final int id;
  final String nome;
  final String codigo;
  final DateTime ultimaData;

  Equipamento({
    required this.id,
    required this.nome,
    required this.codigo,
    required this.ultimaData,
  });

  // Método para converter o Equipamento em Map (para persistência no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'codigo': codigo,
      'ultima_data': ultimaData.toIso8601String(),
    };
  }

  // Método para criar um Equipamento a partir de um Map (do banco de dados)
  factory Equipamento.fromMap(Map<String, dynamic> map) {
    return Equipamento(
      id: map['id'],
      nome: map['nome'],
      codigo: map['codigo'],
      ultimaData: DateTime.parse(map['ultima_data']),
    );
  }
}
