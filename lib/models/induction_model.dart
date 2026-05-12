import 'package:isar/isar.dart';

part 'induction_model.g.dart';

@collection
class Induction {
  Id id = Isar.autoIncrement;

  @Index()
  late String nombreContratista;

  @Index()
  late DateTime fechaInduccion;

  late String actividad; // Actividad que realizó

  late String lugar; // Lugar donde se realizó

  late String notas; // Observaciones

  late DateTime fechaCreacion;

  Induction({
    required this.nombreContratista,
    required this.fechaInduccion,
    required this.actividad,
    required this.lugar,
    this.notas = '',
  }) {
    fechaCreacion = DateTime.now();
  }

  // Constructor vacío requerido por Isar
  Induction.empty();
}
