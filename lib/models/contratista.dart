import 'package:isar/isar.dart';

part 'contratista.g.dart'; // Archivo que se generará automáticamente

@collection
class Contratista {
  Id id = Isar.autoIncrement; // ID autoincremental

  late String nombre;
  late String empresa;
  late String ubicacion;
  late DateTime fechaInduccion;
  bool tieneInduccion = false;
  late String lugar; // Lugar del proyecto o actividad
  late String actividad; // Actividad o proyecto realizado
}