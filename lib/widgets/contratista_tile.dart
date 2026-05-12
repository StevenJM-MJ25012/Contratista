import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/contratista.dart';

class ContratistaTile extends StatelessWidget {
  final Contratista contratista;
  final VoidCallback onToggleInduccion;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ContratistaTile({
    super.key,
    required this.contratista,
    required this.onToggleInduccion,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = contratista.tieneInduccion ? Colors.green : Colors.orange;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withOpacity(0.95),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado con avatar y estado
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      child: Icon(
                        Icons.person,
                        size: 28,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contratista.nombre,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          contratista.empresa,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: statusColor.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Chip(
                      label: Text(
                        contratista.tieneInduccion ? 'Completada' : 'Pendiente',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      backgroundColor: statusColor,
                      side: BorderSide.none,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 18),
              
              // Divisor visual
              Container(
                height: 1,
                color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.3),
              ),
              
              const SizedBox(height: 16),
              
              // Información detallada
              _buildInfoSection(context, Icons.calendar_today, 'Fecha de Inducción',
                  '${contratista.fechaInduccion.day}/${contratista.fechaInduccion.month}/${contratista.fechaInduccion.year}'),
              
              const SizedBox(height: 12),
              
              _buildInfoSection(context, Icons.location_on, 'Lugar', contratista.lugar),
              
              const SizedBox(height: 12),
              
              _buildInfoSection(context, Icons.task_alt, 'Actividad', contratista.actividad),
              
              const SizedBox(height: 20),
              
              // Botones de acción
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildActionButton(
                    context,
                    icon: Icons.delete_outline,
                    color: Colors.red.shade600,
                    tooltip: 'Eliminar',
                    onPressed: onDelete,
                  ),
                  const SizedBox(width: 8),
                  _buildActionButton(
                    context,
                    icon: Icons.edit_outlined,
                    color: Colors.blue.shade600,
                    tooltip: 'Editar',
                    onPressed: onEdit,
                  ),
                  const SizedBox(width: 8),
                  _buildActionButton(
                    context,
                    icon: contratista.tieneInduccion ? Icons.check_circle : Icons.error_outline,
                    color: statusColor,
                    tooltip: contratista.tieneInduccion ? 'Marcar pendiente' : 'Marcar completada',
                    onPressed: onToggleInduccion,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Tooltip(
      message: tooltip,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(10),
            splashColor: color.withOpacity(0.2),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color.withOpacity(0.1),
              ),
              child: Icon(
                icon,
                size: 20,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

