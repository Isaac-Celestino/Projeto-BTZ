import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/equipamento.dart';

class DBService {
  Future<Database> _openDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'inventario.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE equipamentos(id INTEGER PRIMARY KEY, nome TEXT, codigo TEXT, ultima_data TEXT)',
        );
      },
    );
  }

  Future<void> insertEquipamento(Equipamento equipamento) async {
    final db = await _openDatabase();
    await db.insert('equipamentos', equipamento.toMap());
  }

  Future<List<Equipamento>> getEquipamentos() async {
    final db = await _openDatabase();
    final List<Map<String, dynamic>> maps = await db.query('equipamentos');

    return List.generate(maps.length, (i) {
      return Equipamento.fromMap(maps[i]);
    });
  }
}
