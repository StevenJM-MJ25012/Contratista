import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/contratista.dart';
import '../widgets/contratista_tile.dart';
import '../widgets/registro_dialog.dart';

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
  bool? filtroInduccion;

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

      final coincideInduccion = filtroInduccion == null || c.tieneInduccion == filtroInduccion;
      return coincideNombreEmpresa && coincideFecha && coincideInduccion;
    }).toList();
  }

  void _toggleInduccion(Contratista contratista) async {
    contratista.tieneInduccion = !contratista.tieneInduccion;
    await widget.isar.writeTxn(() async {
      await widget.isar.contratistas.put(contratista);
    });
    _cargarContratistas();
  }

  Future<void> _guardarContratista(String nombre, String empresa, DateTime fecha, String lugar, String actividad, {Contratista? editar}) async {
    final contratista = editar ?? Contratista()
      ..nombre = nombre
      ..empresa = empresa
      ..ubicacion = 'Planta Principal'
      ..fechaInduccion = fecha
      ..tieneInduccion = true
      ..lugar = lugar
      ..actividad = actividad;

    if (editar != null) {
      contratista.id = editar.id;
      contratista.nombre = nombre;
      contratista.empresa = empresa;
      contratista.fechaInduccion = fecha;
      contratista.lugar = lugar;
      contratista.actividad = actividad;
      contratista.tieneInduccion = editar.tieneInduccion;
    }

    await widget.isar.writeTxn(() async {
      await widget.isar.contratistas.put(contratista);
    });
    _cargarContratistas();
    final message = editar == null ? 'Registro guardado' : 'Registro actualizado';
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  Future<void> _eliminarContratista(Contratista contratista) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar registro'),
        content: const Text('¿Seguro que deseas eliminar este registro?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Eliminar')),
        ],
      ),
    );
    if (confirmar == true) {
      await widget.isar.writeTxn(() async {
        await widget.isar.contratistas.delete(contratista.id);
      });
      _cargarContratistas();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registro eliminado')));
      }
    }
  }

  void _mostrarDialogoRegistro({Contratista? editar}) {
    showDialog(
      context: context,
      builder: (context) => RegistroDialog(
        editar: editar,
        onGuardar: (nombre, empresa, fecha, lugar, actividad) {
          _guardarContratista(nombre, empresa, fecha, lugar, actividad, editar: editar);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Control de Inducciones'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary],
              ),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Registra y consulta inducciones',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Filtra por nombre, empresa, fecha o estado de inducción.',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildSearchField(),
                        const SizedBox(height: 14),
                        _buildDateFilter(),
                        const SizedBox(height: 14),
                        _buildFilterChips(),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () => _mostrarDialogoRegistro(),
                          icon: const Icon(Icons.add),
                          label: const Text('Nuevo registro'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: contratistasFiltrados.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'No hay registros para mostrar. Crea un nuevo registro usando el botón arriba.',
                        style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 16, bottom: 24),
                    itemCount: contratistasFiltrados.length,
                    itemBuilder: (context, index) {
                      final contratista = contratistasFiltrados[index];
                      return Dismissible(
                        key: ValueKey(contratista.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 24),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        confirmDismiss: (direction) async {
                          return await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Eliminar registro'),
                                  content: const Text('¿Deseas eliminar este registro?'),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
                                    ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Eliminar')),
                                  ],
                                ),
                              ) ==
                              true;
                        },
                        onDismissed: (direction) async {
                          await widget.isar.writeTxn(() async {
                            await widget.isar.contratistas.delete(contratista.id);
                          });
                          _cargarContratistas();
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registro eliminado')));
                          }
                        },
                        child: ContratistaTile(
                          contratista: contratista,
                          onToggleInduccion: () => _toggleInduccion(contratista),
                          onEdit: () => _mostrarDialogoRegistro(editar: contratista),
                          onDelete: () => _eliminarContratista(contratista),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Buscar por nombre o empresa',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onChanged: (value) {
        setState(() {
          busquedaNombreEmpresa = value;
          _filtrarContratistas();
        });
      },
    );
  }

  Widget _buildDateFilter() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              final fecha = await showDatePicker(
                context: context,
                initialDate: busquedaFecha ?? DateTime.now(),
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
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, size: 18, color: Colors.black54),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      busquedaFecha == null
                          ? 'Seleccionar fecha'
                          : '${busquedaFecha!.day}/${busquedaFecha!.month}/${busquedaFecha!.year}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  if (busquedaFecha != null)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          busquedaFecha = null;
                          _filtrarContratistas();
                        });
                      },
                      child: const Icon(Icons.clear, size: 20, color: Colors.black45),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildFilterChip('Todas', filtroInduccion == null, Colors.blue),
        _buildFilterChip('Completadas', filtroInduccion == true, Colors.green),
        _buildFilterChip('Pendientes', filtroInduccion == false, Colors.orange),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool selected, Color color) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      selectedColor: color.withOpacity(0.2),
      showCheckmark: false,
      backgroundColor: Colors.grey.shade200,
      labelStyle: TextStyle(color: selected ? color.darken(0.3) : Colors.black87),
      onSelected: (_) {
        setState(() {
          filtroInduccion = label == 'Todas'
              ? null
              : label == 'Completadas'
                  ? true
                  : false;
          _filtrarContratistas();
        });
      },
    );
  }
}

extension on Color {
  Color darken(double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
  }
}
