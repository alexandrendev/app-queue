import 'package:flutter/material.dart';

class RefreshableList<T> extends StatefulWidget {
  final Future<List<T>> Function() onRefresh;
  final Widget Function(BuildContext, List<T>) builder;
  final Widget? emptyWidget;
  final Widget? errorWidget;

  const RefreshableList({
    super.key,
    required this.onRefresh,
    required this.builder,
    this.emptyWidget,
    this.errorWidget,
  });

  @override
  State<RefreshableList<T>> createState() => _RefreshableListState<T>();
}

class _RefreshableListState<T> extends State<RefreshableList<T>> {
  late Future<List<T>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.onRefresh();
  }

  Future<void> _refresh() async {
    setState(() {
      _future = widget.onRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: FutureBuilder<List<T>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return widget.errorWidget ?? 
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Erro: ${snapshot.error}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refresh,
                      child: const Text('Tentar Novamente'),
                    ),
                  ],
                ),
              );
          }

          final data = snapshot.data ?? [];
          
          if (data.isEmpty) {
            return widget.emptyWidget ?? 
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.inbox, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('Nenhum item encontrado'),
                  ],
                ),
              );
          }

          return widget.builder(context, data);
        },
      ),
    );
  }
}