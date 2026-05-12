import 'package:flutter/material.dart';
import '../models/induction_model.dart';
import '../services/database_service.dart';
import '../widgets/step_indicator.dart';

class CreateInductionScreen extends StatefulWidget {
  const CreateInductionScreen({Key? key}) : super(key: key);

  @override
  State<CreateInductionScreen> createState() => _CreateInductionScreenState();
}

class _CreateInductionScreenState extends State<CreateInductionScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  // Paso 1: Datos del contratista
  final _nombreController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _emailController = TextEditingController();

  // Paso 2: Programación
  DateTime _selectedDate = DateTime.now();
  final _actividadController = TextEditingController();
  final _lugarController = TextEditingController();

  // Paso 3: Observaciones
  final _notasController = TextEditingController();

  final _dbService = DatabaseService.instance;

  @override
  void dispose() {
    _nombreController.dispose();
    _telefonoController.dispose();
    _emailController.dispose();
    _actividadController.dispose();
    _lugarController.dispose();
    _notasController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final induction = Induction(
        nombreContratista: _nombreController.text.trim(),
        fechaInduccion: _selectedDate,
        actividad: _actividadController.text.trim(),
        lugar: _lugarController.text.trim(),
        notas: _notasController.text.trim(),
      );

      final success = await _dbService.createInduction(induction);

      if (!mounted) return;

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Inducción registrada exitosamente!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        _resetForm();
        setState(() {
          _currentStep = 0;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error al registrar la inducción'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void _resetForm() {
    _nombreController.clear();
    _telefonoController.clear();
    _emailController.clear();
    _actividadController.clear();
    _lugarController.clear();
    _notasController.clear();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Inducción'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Step Indicator
              StepIndicator(
                currentStep: _currentStep,
                totalSteps: 3,
                labels: const ['Datos', 'Actividad', 'Observaciones'],
              ),
              const SizedBox(height: 32),

              // Form content
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (_currentStep == 0) _buildStep1(),
                    if (_currentStep == 1) _buildStep2(),
                    if (_currentStep == 2) _buildStep3(),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Navigation buttons
              Row(
                children: [
                  if (_currentStep > 0)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            _currentStep--;
                          });
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Anterior'),
                      ),
                    ),
                  if (_currentStep > 0) const SizedBox(width: 16),
                  Expanded(
                    child: _currentStep == 2
                        ? FilledButton.icon(
                            onPressed: _submitForm,
                            icon: const Icon(Icons.check_circle),
                            label: const Text('Registrar'),
                          )
                        : FilledButton.icon(
                            onPressed: () {
                              if (_nombreController.text.isNotEmpty &&
                                  _actividadController.text.isNotEmpty &&
                                  _lugarController.text.isNotEmpty) {
                                setState(() {
                                  _currentStep++;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Por favor completa los campos requeridos'),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text('Siguiente'),
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

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Datos del Contratista',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _nombreController,
          decoration: InputDecoration(
            labelText: 'Nombre Completo *',
            hintText: 'Ej: Juan Pérez',
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'El nombre es requerido';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _telefonoController,
          decoration: InputDecoration(
            labelText: 'Teléfono (Opcional)',
            hintText: 'Ej: +57 123456789',
            prefixIcon: const Icon(Icons.phone),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email (Opcional)',
            hintText: 'Ej: juan@example.com',
            prefixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: (value) {
            if (value?.isNotEmpty ?? false) {
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                return 'Ingresa un email válido';
              }
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Detalles de la Inducción',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: Colors.blue.withOpacity(0.1),
          child: ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Fecha de Inducción'),
            subtitle: Text(
              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
            ),
            trailing: const Icon(Icons.edit),
            onTap: _selectDate,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _actividadController,
          decoration: InputDecoration(
            labelText: 'Actividad Realizada *',
            hintText: 'Ej: Inducción Laboral, Capacitación de Seguridad',
            prefixIcon: const Icon(Icons.assignment),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          maxLines: 2,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'La actividad es requerida';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _lugarController,
          decoration: InputDecoration(
            labelText: 'Lugar de la Inducción *',
            hintText: 'Ej: Oficina Principal, Sala de Capacitación',
            prefixIcon: const Icon(Icons.location_on),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'El lugar es requerido';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notas y Observaciones',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _notasController,
          decoration: InputDecoration(
            labelText: 'Notas/Observaciones (Opcional)',
            hintText: 'Información adicional o comentarios',
            prefixIcon: const Icon(Icons.notes),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          maxLines: 5,
        ),
        const SizedBox(height: 24),
        const Text(
          'Resumen de Registro',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSummaryItem('Nombre:', _nombreController.text),
                if (_telefonoController.text.isNotEmpty)
                  _buildSummaryItem('Teléfono:', _telefonoController.text),
                if (_emailController.text.isNotEmpty)
                  _buildSummaryItem('Email:', _emailController.text),
                _buildSummaryItem(
                    'Fecha:',
                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                _buildSummaryItem('Actividad:', _actividadController.text),
                _buildSummaryItem('Lugar:', _lugarController.text),
                if (_notasController.text.isNotEmpty) ...
                  [
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    _buildSummaryItem('Notas:', _notasController.text),
                  ]
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
