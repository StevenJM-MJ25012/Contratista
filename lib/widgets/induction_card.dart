import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/induction_model.dart';
import '../services/database_service.dart';

class InductionCard extends StatefulWidget {
  final Induction induction;
  final VoidCallback onStatusChanged;

  const InductionCard({
    Key? key,
    required this.induction,
    required this.onStatusChanged,
  }) : super(key: key);

  @override
  State<InductionCard> createState() => _InductionCardState();
}

class _InductionCardState extends State<InductionCard> {
  final _dbService = DatabaseService.instance;
  late String _currentStatus;
  final _notasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.induction.estado;
    _notasController.text = widget.induction.notas;
  }

  @override
  void dispose() {
    _notasController.dispose();
    super.dispose();
  }

  Color _getStatusColor() {
    switch (_currentStatus) {
      case 'completada':
        return Colors.green;
      case 'pendiente':
        return Colors.orange;
      case 'reprogramada':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon() {
    switch (_currentStatus) {
      case 'completada':
        return Icons.check_circle;
      case 'pendiente':
        return Icons.schedule;
      case 'reprogramada':
        return Icons.edit_calendar;
      default:
        return Icons.info;
    }
  }

  String _getStatusLabel() {
    switch (_currentStatus) {
      case 'completada':
        return 'Completada';
      case 'pendiente':
        return 'Pendiente';
      case 'reprogramada':
        return 'Reprogramada';
      default:
        return 'Desconocido';
    }
  }

  void _showStatusDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Actualizar Estado',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...[('pendiente', 'Pendiente'), ('completada', 'Completada'), ('reprogramada', 'Reprogramada')]
                .map(
              (item) => ListTile(
                leading: Icon(_getStatusIconForStatus(item.$1)),
                title: Text(item.$2),
                trailing: _currentStatus == item.$1
                    ? const Icon(Icons.check_circle, color: Colors.blue)
                    : null,
                onTap: () {
                  setState(() {
                    _currentStatus = item.$1;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _notasController,
              decoration: InputDecoration(
                labelText: 'Notas',
                hintText: 'Agregar observaciones',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      await _dbService.updateInductionStatus(
                        widget.induction.id,
                        _currentStatus,
                        _notasController.text,
                      );
                      if (!mounted) return;
                      Navigator.pop(context);
                      widget.onStatusChanged();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Estado actualizado'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Text('Guardar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getStatusIconForStatus(String status) {
    switch (status) {
      case 'completada':
        return Icons.check_circle;
      case 'pendiente':
        return Icons.schedule;
      case 'reprogramada':
        return Icons.edit_calendar;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: _showStatusDialog,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header con estado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.induction.nombreCompleto,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _getStatusColor()),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getStatusIcon(),
                          color: _getStatusColor(),
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _getStatusLabel(),
                          style: TextStyle(
                            color: _getStatusColor(),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Información detallada
              Row(
                children: [
                  Icon(
                    Icons.credit_card,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.induction.cedula,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.induction.horaInduccion,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.business,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.induction.departamento,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Encargado: ${widget.induction.nombreEncargado}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
              if (widget.induction.notas.isNotEmpty) ...
                [
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Notas:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.induction.notas,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Registrado: ${DateFormat('dd/MM/yyyy hh:mm').format(widget.induction.fechaCreacion)}',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Eliminar registro'),
                          content: const Text(
                            '¿Estás seguro de que deseas eliminar este registro?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text(
                                'Eliminar',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                      if (confirm ?? false) {
                        await _dbService.deleteInduction(widget.induction.id);
                        if (!mounted) return;
                        widget.onStatusChanged();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registro eliminado'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.delete, size: 18),
                    label: const Text('Eliminar'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
