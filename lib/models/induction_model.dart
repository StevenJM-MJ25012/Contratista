import 'package:isar/isar.dart';

part 'induction_model.g.dart';

@collection
class Induction {
  Id id = Isar.autoIncrement;

  @Index()
  late String nombreCompleto;

  @Index(unique: true)
  late String cedula; // Campo único para evitar duplicados

  @Index()
  late DateTime fechaInduccion;

  late String horaInduccion; // HH:mm

  late String departamento;

  late String nombreEncargado;

  late String telefonoContacto;

  late String email;

  late String estado; // 'completada', 'pendiente', 'reprogramada'

  late String notas; // Observaciones durante la inducción

  late DateTime fechaCreacion;

  late DateTime? fechaCompletacion;

  Induction({
    required this.nombreCompleto,
    required this.cedula,
    required this.fechaInduccion,
    required this.horaInduccion,
    required this.departamento,
    required this.nombreEncargado,
    required this.telefonoContacto,
    required this.email,
    this.estado = 'pendiente',
    this.notas = '',
  }) {
    fechaCreacion = DateTime.now();
  }

  // Constructor vacío requerido por Isar
  Induction.empty();
}
