import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/contratista.dart';

class RegistroDialog extends StatefulWidget {
  final Contratista? editar;
  final void Function(String nombre, String empresa, DateTime fecha, String lugar, String actividad) onGuardar;

  const RegistroDialog({super.key, this.editar, required this.onGuardar});

  @override
  State<RegistroDialog> createState() => _RegistroDialogState();
}

class _RegistroDialogState extends State<RegistroDialog> {
  late final TextEditingController _nombreController;
  late final TextEditingController _empresaController;
  late final TextEditingController _lugarController;
  late final TextEditingController _actividadController;
  late DateTime _fechaInduccion;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.editar?.nombre ?? '');
    _empresaController = TextEditingController(text: widget.editar?.empresa ?? '');
    _lugarController = TextEditingController(text: widget.editar?.lugar ?? '');
    _actividadController = TextEditingController(text: widget.editar?.actividad ?? '');
    _fechaInduccion = widget.editar?.fechaInduccion ?? DateTime.now();
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _empresaController.dispose();
    _lugarController.dispose();
    _actividadController.dispose();
    super.dispose();
  }

  Future<void> _seleccionarFecha() async {
    final nuevaFecha = await showDatePicker(
      context: context,
      initialDate: _fechaInduccion,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (nuevaFecha != null) {
      setState(() {
        _fechaInduccion = nuevaFecha;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      elevation: 16,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withOpacity(0.98),
            ],
          ),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.editar == null ? 'Nuevo Registro' : 'Editar Registro',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Completa todos los campos para ${widget.editar == null ? 'crear' : 'actualizar'} el registro',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),
                _buildField(
                  label: 'Nombre Completo',
                  controller: _nombreController,
                  icon: Icons.person_outline,
                  hint: 'Ej. Juan García López',
                ),
                const SizedBox(height: 14),
                _buildField(
                  label: 'Empresa',
                  controller: _empresaController,
                  icon: Icons.business_center_outlined,
                  hint: 'Ej. Acme Corp',
                ),
                const SizedBox(height: 14),
                _buildField(
                  label: 'Lugar del Proyecto',
                  controller: _lugarController,
                  icon: Icons.location_on_outlined,
                  hint: 'Ej. Planta Sur',
                ),
                const SizedBox(height: 14),
                _buildField(
                  label: 'Actividad Realizada',
                  controller: _actividadController,
                  icon: Icons.task_outlined,
                  hint: 'Ej. Mantenimiento de equipos',
                  maxLines: 2,
                ),
                const SizedBox(height: 18),
                _buildDatePicker(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        'Cancelar',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_nombreController.text.trim().isEmpty ||
                            _empresaController.text.trim().isEmpty ||
                            _lugarController.text.trim().isEmpty ||
                            _actividadController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Por favor completa todos los campos')),
                          );
                          return;
                        }
                        widget.onGuardar(
                          _nombreController.text.trim(),
                          _empresaController.text.trim(),
                          _fechaInduccion,
                          _lugarController.text.trim(),
                          _actividadController.text.trim(),
                        );
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        widget.editar == null ? 'Guardar' : 'Actualizar',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
              fontSize: 14,
            ),
            prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fecha de Inducción',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: _seleccionarFecha,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(Icons.calendar_month_outlined, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${_fechaInduccion.day}/${_fechaInduccion.month}/${_fechaInduccion.year}',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

