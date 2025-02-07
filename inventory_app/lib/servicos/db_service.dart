import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../modelos/equipamento.dart';

class DBService {
  // Função para abrir ou criar o banco de dados
  Future<Database> _openDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'inventario.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE equipamentos(id TEXT PRIMARY KEY, nome TEXT, codigo TEXT, ultima_data TEXT)',
        );
      },
    );
  }

  // Função para inserir um novo equipamento no banco de dados
  Future<void> insertEquipamento(Equipamento equipamento) async {
    final db = await _openDatabase();
    await db.insert(
      'equipamentos',
      equipamento.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // Caso o ID já exista, substitui o registro
    );
  }

  // Função para obter todos os equipamentos
  Future<List<Equipamento>> getEquipamentos() async {
    final db = await _openDatabase();
    final List<Map<String, dynamic>> maps = await db.query('equipamentos');

    // Converte a lista de mapas em objetos Equipamento
    return List.generate(maps.length, (i) {
      return Equipamento.fromMap(maps[i]);
    });
  }

  // Função para atualizar os dados de um equipamento existente
  Future<void> updateEquipamento(Equipamento equipamento) async {
    final db = await _openDatabase();
    await db.update(
      'equipamentos',
      equipamento.toMap(),
      where: 'id = ?',
      whereArgs: [equipamento.id],
    );
  }

  // Função para remover um equipamento do banco de dados
  Future<void> deleteEquipamento(String id) async {
    final db = await _openDatabase();
    await db.delete(
      'equipamentos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
