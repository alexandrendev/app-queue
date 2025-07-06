import 'package:app_queue/core/search_service.dart';
import 'package:app_queue/model/paciente_model.dart';
import 'package:app_queue/view/components/my_text_input.dart';
import 'package:flutter/material.dart';

class SearchPatientsPage extends StatefulWidget {
  const SearchPatientsPage({super.key});

  @override
  State<SearchPatientsPage> createState() => _SearchPatientsPageState();
}

class _SearchPatientsPageState extends State<SearchPatientsPage> {
  final TextEditingController _searchController = TextEditingController();
  List<PacienteModel> _searchResults = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final results = await SearchService.searchPatients(query);
      setState(() {
        _searchResults = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro na busca: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Pacientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyTextInput(
              hintText: 'Buscar por nome ou CPF',
              obscureText: false,
              controller: _searchController,
              validator: null,
              keyboardType: TextInputType.text,
              prefixIcon: Icons.search,
              enabled: true,
              placeHolder: 'Digite o nome ou CPF do paciente',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _performSearch,
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_searchResults.isEmpty && _searchController.text.isNotEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('Nenhum paciente encontrado', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    if (_searchResults.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('Digite para buscar pacientes', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final patient = _searchResults[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(patient.nome),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CPF: ${patient.cpf}'),
                Text('Telefone: ${patient.telefone}'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.info),
              onPressed: () => _showPatientDetails(patient),
            ),
          ),
        );
      },
    );
  }

  void _showPatientDetails(PacienteModel patient) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(patient.nome),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CPF: ${patient.cpf}'),
            Text('Telefone: ${patient.telefone}'),
            Text('Endereço: ${patient.endereco}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }
}