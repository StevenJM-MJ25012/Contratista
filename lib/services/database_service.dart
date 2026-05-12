import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/induction_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  late Isar isar;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  static DatabaseService get instance => _instance;

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [InductionSchema],
      directory: dir.path,
    );
  }

  // Crear nueva inducción
  Future<bool> createInduction(Induction induction) async {
    try {
      await isar.writeTxn(() async {
        await isar.inductions.put(induction);
      });
      return true;
    } catch (e) {
      print('Error creando inducción: $e');
      return false;
    }
  }

  // Obtener todas las inducciones
  Future<List<Induction>> getAllInductions() async {
    return await isar.inductions
        .where()
        .sortByFechaInduccionDesc()
        .findAll();
  }

  // Obtener inducciones por fecha
  Future<List<Induction>> getInductionsByDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return await isar.inductions
        .where()
        .fechaInduccionBetween(startOfDay, endOfDay)
        .sortByFechaInduccionDesc()
        .findAll();
  }

  // Buscar inducciones
  Future<List<Induction>> searchInductions(String query) async {
    if (query.isEmpty) return getAllInductions();

    return await isar.inductions
        .where()
        .filter()
        .nombreContratistaContains(query, caseSensitive: false)
        .sortByFechaInduccionDesc()
        .findAll();
  }

  // Verificar si un contratista ya tiene inducción registrada
  Future<bool> hasInductionRecord(String nombre) async {
    final existing = await isar.inductions
        .where()
        .nombreContratistaEqualTo(nombre.trim().toLowerCase())
        .findFirst();
    return existing != null;
  }

  // Eliminar inducción
  Future<bool> deleteInduction(int id) async {
    try {
      await isar.writeTxn(() async {
        return await isar.inductions.delete(id);
      });
      return true;
    } catch (e) {
      print('Error eliminando inducción: $e');
      return false;
    }
  }
}
