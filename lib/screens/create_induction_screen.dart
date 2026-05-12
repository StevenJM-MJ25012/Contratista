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

  // Controllers para paso 1: Datos Básicos
  final _nombreController = TextEditingController();
  final _cedulaController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _emailController = TextEditingController();

  // Controllers para paso 2: Programación
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedDepartment = 'Recursos Humanos';

  // Controllers para paso 3: Encargado
  final _nombreEncargadoController = TextEditingController();
  final _notasController = TextEditingController();

  final _dbService = DatabaseService.instance;

  @override
  void dispose() {
    _nombreController.dispose();
    _cedulaController.dispose();
    _telefonoController.dispose();
    _emailController.dispose();
    _nombreEncargadoController.dispose();
    _notasController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final induction = Induction(
        nombreCompleto: _nombreController.text.trim(),
        cedula: _cedulaController.text.trim(),
        fechaInduccion: _selectedDate,
        horaInduccion:
            '${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}',
        departamento: _selectedDepartment,
        nombreEncargado: _nombreEncargadoController.text.trim(),
        telefonoContacto: _telefonoController.text.trim(),
        email: _emailController.text.trim(),
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
            content: Text('Error: Ya existe una inducción con esta cédula'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void _resetForm() {
    _nombreController.clear();
    _cedulaController.clear();
    _telefonoController.clear();
    _emailController.clear();
    _nombreEncargadoController.clear();
    _notasController.clear();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
    _selectedDepartment = 'Recursos Humanos';
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
                labels: const ['Datos', 'Programación', 'Confirmación'],
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
                              if (_currentStep == 0) {
                                if (_nombreController.text.isNotEmpty &&
                                    _cedulaController.text.isNotEmpty) {
                                  setState(() {
                                    _currentStep++;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Por favor completa todos los campos'),
                                    ),
                                  );
                                }
                              } else {
                                setState(() {
                                  _currentStep++;
                                });
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
            labelText: 'Nombre Completo',
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
          controller: _cedulaController,
          decoration: InputDecoration(
            labelText: 'Cédula/Documento',
            hintText: 'Ej: 123456789',
            prefixIcon: const Icon(Icons.credit_card),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'La cédula es requerida';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _telefonoController,
          decoration: InputDecoration(
            labelText: 'Teléfono',
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
            labelText: 'Email',
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
          'Programación de Inducción',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: Colors.blue.withOpacity(0.1),
          child: ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Fecha'),
            subtitle: Text(
              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
            ),
            trailing: const Icon(Icons.edit),
            onTap: _selectDate,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: Colors.purple.withOpacity(0.1),
          child: ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text('Hora'),
            subtitle: Text(_selectedTime.format(context)),
            trailing: const Icon(Icons.edit),
            onTap: _selectTime,
          ),
        ),
        const SizedBox(height: 16),
        const Text('Departamento', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: _selectedDepartment,
            underline: const SizedBox(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onChanged: (String? newValue) {
              setState(() {
                _selectedDepartment = newValue ?? 'Recursos Humanos';
              });
            },
            items: [
              'Recursos Humanos',
              'Operaciones',
              'Ventas',
              'Tecnología',
              'Finanzas',
              'Otro',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Detalles Finales',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _nombreEncargadoController,
          decoration: InputDecoration(
            labelText: 'Nombre del Encargado',
            hintText: 'Responsable de la inducción',
            prefixIcon: const Icon(Icons.badge),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'El encargado es requerido';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _notasController,
          decoration: InputDecoration(
            labelText: 'Notas/Observaciones (Opcional)',
            hintText: 'Información adicional',
            prefixIcon: const Icon(Icons.notes),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          maxLines: 4,
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
                _buildSummaryItem('Cédula:', _cedulaController.text),
                _buildSummaryItem('Fecha:', '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                _buildSummaryItem('Hora:', _selectedTime.format(context)),
                _buildSummaryItem('Departamento:', _selectedDepartment),
                _buildSummaryItem('Encargado:', _nombreEncargadoController.text),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }
}
