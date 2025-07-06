import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionStatusBar extends StatefulWidget {
  const ConnectionStatusBar({super.key});

  @override
  State<ConnectionStatusBar> createState() => _ConnectionStatusBarState();
}

class _ConnectionStatusBarState extends State<ConnectionStatusBar> {
  bool _isOnline = true;

  @override
  void initState() {
    super.initState();
    _checkConnection();
    Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _checkConnection() async {
    final result = await Connectivity().checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      _isOnline = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isOnline) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      color: Colors.red,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, color: Colors.white, size: 16),
          SizedBox(width: 8),
          Text(
            'Sem conexão - Modo offline',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}