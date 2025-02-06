import 'package:cloud_firestore/cloud_firestore.dart';
import '../modelos/equipamento.dart';

class DBService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Adicionar equipamento no Firestore
  Future<void> insertEquipamento(Equipamento equipamento) async {
    try {
      final docRef = _db.collection('equipamentos').doc();  // Gera um novo ID automaticamente
      await docRef.set(equipamento.toMap());  // Salva os dados no Firestore
    } catch (e) {
      print("Erro ao adicionar equipamento: $e");
    }
  }

  // Obter lista de equipamentos do Firestore
  Future<List<Equipamento>> getEquipamentos() async {
    try {
      final querySnapshot = await _db.collection('equipamentos').get();  // Consulta a coleção "equipamentos"

      return querySnapshot.docs.map((doc) {
        return Equipamento.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();  // Retorna a lista de equipamentos
    } catch (e) {
      print("Erro ao obter equipamentos: $e");
      return [];
    }
  }
}
