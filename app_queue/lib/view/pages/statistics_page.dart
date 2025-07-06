import 'package:app_queue/core/statistics_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  Map<String, dynamic>? _dailyStats;
  Map<String, dynamic>? _weeklyStats;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStatistics();
  }

  Future<void> _loadStatistics() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final daily = await StatisticsService.getDailyStatistics();
      final weekly = await StatisticsService.getWeeklyStatistics();
      
      setState(() {
        _dailyStats = daily;
        _weeklyStats = weekly;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar estatísticas: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estatísticas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadStatistics,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadStatistics,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildDailyStatistics(),
                  const SizedBox(height: 24),
                  _buildWeeklyStatistics(),
                ],
              ),
            ),
    );
  }

  Widget _buildDailyStatistics() {
    if (_dailyStats == null) return const SizedBox();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.today, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Estatísticas de Hoje',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              DateFormat('dd/MM/yyyy').format(_dailyStats!['date']),
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            _buildStatCard(
              'Total de Fichas',
              _dailyStats!['totalFichas'].toString(),
              Icons.description,
              Colors.blue,
            ),
            const SizedBox(height: 8),
            _buildStatCard(
              'Aguardando Triagem',
              _dailyStats!['waitingTriagem'].toString(),
              Icons.hourglass_empty,
              Colors.orange,
            ),
            const SizedBox(height: 16),
            const Text(
              'Por Prioridade:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ..._buildPriorityStats(_dailyStats!['priorities']),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyStatistics() {
    if (_weeklyStats == null) return const SizedBox();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_view_week, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  'Estatísticas da Semana',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildStatCard(
              'Total da Semana',
              _weeklyStats!['totalWeek'].toString(),
              Icons.bar_chart,
              Colors.green,
            ),
            const SizedBox(height: 16),
            const Text(
              'Por Dia:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ..._buildDailyStats(_weeklyStats!['dailyCount']),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPriorityStats(Map<String, int> priorities) {
    return priorities.entries.map((entry) {
      final color = _getPriorityColor(entry.key);
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(entry.key)),
            Text(
              entry.value.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  List<Widget> _buildDailyStats(Map<String, int> dailyCount) {
    return dailyCount.entries.map((entry) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Text(
                entry.key,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: LinearProgressIndicator(
                value: entry.value / (_getMaxDailyValue(dailyCount) + 1),
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              entry.value.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }).toList();
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Não urgente': return Colors.green;
      case 'Pouco urgente': return Colors.yellow[700]!;
      case 'Urgente': return Colors.orange;
      case 'Muito urgente': return Colors.red[700]!;
      case 'Emergência': return Colors.red;
      default: return Colors.grey;
    }
  }

  int _getMaxDailyValue(Map<String, int> dailyCount) {
    return dailyCount.values.isEmpty ? 0 : dailyCount.values.reduce((a, b) => a > b ? a : b);
  }
}