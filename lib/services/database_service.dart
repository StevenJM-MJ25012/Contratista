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

  // Crear nueva inducción con validación de duplicados
  Future<bool> createInduction(Induction induction) async {
    try {
      // Verificar si ya existe una inducción con la misma cédula
      final exists = await isar.inductions
          .where()
          .cedulaEqualTo(induction.cedula)
          .findFirst();

      if (exists != null) {
        return false; // Duplicado encontrado
      }

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
        .sortByHoraInduccion()
        .findAll();
  }

  // Buscar inducciones
  Future<List<Induction>> searchInductions(String query) async {
    if (query.isEmpty) return getAllInductions();

    return await isar.inductions
        .where()
        .filter()
        .nombreCompletoContains(query, caseSensitive: false)
        .or()
        .cedulaContains(query, caseSensitive: false)
        .or()
        .departamentoContains(query, caseSensitive: false)
        .sortByFechaInduccionDesc()
        .findAll();
  }

  // Actualizar estado de inducción
  Future<bool> updateInductionStatus(
      int id, String newStatus, String notes) async {
    try {
      final induction = await isar.inductions.get(id);
      if (induction != null) {
        induction.estado = newStatus;
        induction.notas = notes;
        if (newStatus == 'completada') {
          induction.fechaCompletacion = DateTime.now();
        }
        await isar.writeTxn(() async {
          await isar.inductions.put(induction);
        });
        return true;
      }
      return false;
    } catch (e) {
      print('Error actualizando inducción: $e');
      return false;
    }
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
