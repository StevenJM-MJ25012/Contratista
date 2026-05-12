import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/induction_model.dart';
import '../services/database_service.dart';
import '../widgets/induction_card.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({Key? key}) : super(key: key);

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  final _dbService = DatabaseService.instance;
  final _searchController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<Induction> _inductions = [];
  List<Induction> _filteredInductions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadInductions();
    _searchController.addListener(_filterInductions);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadInductions() async {
    setState(() {
      _isLoading = true;
    });

    final inductions = await _dbService.getInductionsByDate(_selectedDate);

    setState(() {
      _inductions = inductions;
      _filteredInductions = inductions;
      _isLoading = false;
    });
  }

  Future<void> _filterInductions() async {
    final query = _searchController.text;

    if (query.isEmpty) {
      await _loadInductions();
      return;
    }

    final results = await _dbService.searchInductions(query);
    final dateResults = results
        .where((induction) =>
            induction.fechaInduccion.year == _selectedDate.year &&
            induction.fechaInduccion.month == _selectedDate.month &&
            induction.fechaInduccion.day == _selectedDate.day)
        .toList();

    setState(() {
      _filteredInductions = dateResults.isEmpty ? results : dateResults;
    });

    // Si encontramos resultados en otras fechas, navegar a esa fecha
    if (results.isNotEmpty && dateResults.isEmpty) {
      final newDate = results.first.fechaInduccion;
      setState(() {
        _selectedDate = newDate;
      });
    }
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _searchController.clear();
      });
      await _loadInductions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registros de Inducciones'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(
              controller: _searchController,
              leading: const Icon(Icons.search),
              hintText: 'Buscar por nombre...',
              trailing: _searchController.text.isNotEmpty
                  ? [
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _loadInductions();
                        },
                      ),
                    ]
                  : null,
            ),
          ),

          // Date Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 0,
              color: Colors.blue.withOpacity(0.1),
              child: ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Fecha Seleccionada'),
                subtitle: Text(
                  DateFormat('EEEE, d MMMM y', 'es_ES')
                      .format(_selectedDate),
                ),
                trailing: const Icon(Icons.edit),
                onTap: _selectDate,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Inductions List
          if (_isLoading)
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else if (_filteredInductions.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No hay inducciones registradas',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filteredInductions.length,
                itemBuilder: (context, index) {
                  final induction = _filteredInductions[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InductionCard(
                      induction: induction,
                      onDeleted: () {
                        _loadInductions();
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
