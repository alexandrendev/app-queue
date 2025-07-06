import 'package:app_queue/core/notification_service.dart';
import 'package:app_queue/view/components/my_logo.dart';
import 'package:app_queue/view/pages/notifications_page.dart';
import 'package:app_queue/view/pages/search_patients_page.dart';
import 'package:app_queue/view/pages/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class MyUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyLogo(heigth: 25),
          const SizedBox(width: 15),
          const Text(
            'PA - Pronto Atendimento',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPatientsPage()),
            );
          },
          icon: const Icon(Icons.search, color: Colors.red),
        ),
        ValueListenableBuilder<int>(
          valueListenable: NotificationService().unreadCount,
          builder: (context, unreadCount, child) {
            return Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsPage()),
                    );
                  },
                  icon: const Icon(Icons.notifications, color: Colors.red),
                ),
                if (unreadCount > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        unreadCount > 99 ? '99+' : unreadCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.red),
          onSelected: (value) async {
            switch (value) {
              case 'statistics':
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StatisticsPage()),
                );
                break;
              case 'logout':
                await _logout(context);
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'statistics',
              child: Row(
                children: [
                  Icon(Icons.bar_chart),
                  SizedBox(width: 8),
                  Text('Estatísticas'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'logout',
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 8),
                  Text('Sair'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _logout(BuildContext context) async {
    try {
      final user = await ParseUser.currentUser() as ParseUser?;
      if (user != null) {
        await user.logout();
      }
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao fazer logout: $e')),
        );
      }
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
