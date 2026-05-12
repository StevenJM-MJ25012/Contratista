import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/contratista.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([ContratistaSchema], directory: dir.path);
  runApp(MyApp(isar: isar));
}

class MyApp extends StatelessWidget {
  final Isar isar;
  const MyApp({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HomePage(isar: isar),
    );
  }
}

class HomePage extends StatefulWidget {
  final Isar isar;
  const HomePage({super.key, required this.isar});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contratista> contratistas = [];
  List<Contratista> contratistasFiltrados = [];
  String busquedaNombreEmpresa = '';
  DateTime? busquedaFecha;
  bool? filtroInduccion; // null = todas, true = completadas, false = pendientes

  @override
  void initState() {
    super.initState();
    _cargarContratistas();
  }

  void _cargarContratistas() async {
    final lista = await widget.isar.contratistas.where().findAll();
    setState(() {
      contratistas = lista;
      _filtrarContratistas();
    });
  }

  void _filtrarContratistas() {
    contratistasFiltrados = contratistas.where((c) {
      final coincideNombreEmpresa = busquedaNombreEmpresa.isEmpty ||
          c.nombre.toLowerCase().contains(busquedaNombreEmpresa.toLowerCase()) ||
          c.empresa.toLowerCase().contains(busquedaNombreEmpresa.toLowerCase());
      final coincideFecha = busquedaFecha == null ||
          (c.fechaInduccion.year == busquedaFecha!.year &&
           c.fechaInduccion.month == busquedaFecha!.month &&
           c.fechaInduccion.day == busquedaFecha!.day);
      final coincideInduccion = filtroInduccion == null ||
          c.tieneInduccion == filtroInduccion;
      return coincideNombreEmpresa && coincideFecha && coincideInduccion;
    }).toList();
  }

  void _toggleInduccion(Contratista c) async {
    c.tieneInduccion = !c.tieneInduccion;
    await widget.isar.writeTxn(() async {
      await widget.isar.contratistas.put(c);
    });
    _cargarContratistas();
  }

  void _guardarContratista(String nombre, String empresa, DateTime fecha, String lugar, String actividad, {Contratista? editar}) async {
    final contratista = editar ?? Contratista()
      ..nombre = nombre
      ..empresa = empresa
      ..ubicacion = "Planta Principal"
      ..fechaInduccion = fecha
      ..tieneInduccion = true
      ..lugar = lugar
      ..actividad = actividad;

    if (editar != null) {
      contratista.nombre = nombre;
      contratista.empresa = empresa;
      contratista.fechaInduccion = fecha;
      contratista.lugar = lugar;
      contratista.actividad = actividad;
    }

    await widget.isar.writeTxn(() async {
      await widget.isar.contratistas.put(contratista);
    });
    _cargarContratistas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Control de Inducciones"), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: "Buscar por nombre o empresa",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      busquedaNombreEmpresa = value;
                      _filtrarContratistas();
                    });
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        busquedaFecha == null
                            ? "Seleccionar fecha"
                            : "Fecha: ${busquedaFecha!.day}/${busquedaFecha!.month}/${busquedaFecha!.year}",
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        final fecha = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (fecha != null) {
                          setState(() {
                            busquedaFecha = fecha;
                            _filtrarContratistas();
                          });
                        }
                      },
                    ),
                    if (busquedaFecha != null)
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            busquedaFecha = null;
                            _filtrarContratistas();
                          });
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterChip(
                      label: const Text("Todas"),
                      selected: filtroInduccion == null,
                      backgroundColor: filtroInduccion == null ? Colors.blue.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                      onSelected: (selected) {
                        setState(() {
                          filtroInduccion = null;
                          _filtrarContratistas();
                        });
                      },
                    ),
                    FilterChip(
                      label: const Text("Completadas"),
                      selected: filtroInduccion == true,
                      backgroundColor: filtroInduccion == true ? Colors.green.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                      onSelected: (selected) {
                        setState(() {
                          filtroInduccion = true;
                          _filtrarContratistas();
                        });
                      },
                    ),
                    FilterChip(
                      label: const Text("Pendientes"),
                      selected: filtroInduccion == false,
                      backgroundColor: filtroInduccion == false ? Colors.orange.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                      onSelected: (selected) {
                        setState(() {
                          filtroInduccion = false;
                          _filtrarContratistas();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () => _mostrarDialogoRegistro(context),
                  icon: const Icon(Icons.add),
                  label: const Text("Nuevo Registro"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contratistasFiltrados.length,
              itemBuilder: (context, index) {
                final c = contratistasFiltrados[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(c.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("${c.empresa} • ${c.fechaInduccion.day}/${c.fechaInduccion.month}/${c.fechaInduccion.year}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            c.tieneInduccion ? Icons.check_circle : Icons.error_outline,
                            color: c.tieneInduccion ? Colors.green : Colors.orange,
                          ),
                          onPressed: () => _toggleInduccion(c),
                          tooltip: c.tieneInduccion ? "Marcar como no completada" : "Marcar como completada",
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _mostrarDialogoRegistro(context, editar: c),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarDialogoRegistro(BuildContext context, {Contratista? editar}) {
    String nombre = editar?.nombre ?? '';
    String empresa = editar?.empresa ?? '';
    DateTime fecha = editar?.fechaInduccion ?? DateTime.now();
    String lugar = editar?.lugar ?? '';
    String actividad = editar?.actividad ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(editar == null ? "Registrar Inducción" : "Editar Registro"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Nombre"),
              controller: TextEditingController(text: nombre),
              onChanged: (v) => nombre = v,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Empresa"),
              controller: TextEditingController(text: empresa),
              onChanged: (v) => empresa = v,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Lugar del proyecto o actividad"),
              controller: TextEditingController(text: lugar),
              onChanged: (v) => lugar = v,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Actividad o proyecto realizado"),
              controller: TextEditingController(text: actividad),
              onChanged: (v) => actividad = v,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Fecha de inducción: ${fecha.day}/${fecha.month}/${fecha.year}",
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final nuevaFecha = await showDatePicker(
                      context: context,
                      initialDate: fecha,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (nuevaFecha != null) {
                      fecha = nuevaFecha;
                      // Actualizar el diálogo si es necesario, pero como es stateful, rebuild
                      (context as Element).markNeedsBuild();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar")),
          ElevatedButton(
            onPressed: () {
              _guardarContratista(nombre, empresa, fecha, lugar, actividad, editar: editar);
              Navigator.pop(context);
            },
            child: Text(editar == null ? "Guardar" : "Actualizar"),
          ),
        ],
      ),
    );
  }
}