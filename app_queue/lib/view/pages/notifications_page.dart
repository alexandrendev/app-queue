import 'package:app_queue/core/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _notificationService.markAllAsRead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: () {
              _notificationService.markAllAsRead();
              setState(() {});
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _notificationService.unreadCount,
        builder: (context, unreadCount, child) {
          final notifications = _notificationService.notifications;
          
          if (notifications.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Nenhuma notificação', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: _getNotificationIcon(notification.type),
                  title: Text(
                    notification.title,
                    style: TextStyle(
                      fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.message),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(notification.timestamp),
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  trailing: notification.isRead 
                    ? null 
                    : Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                  onTap: () {
                    if (!notification.isRead) {
                      _notificationService.markAsRead(notification.id);
                      setState(() {});
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.newPatient:
        return const Icon(Icons.person_add, color: Colors.green);
      case NotificationType.triageCompleted:
        return const Icon(Icons.check_circle, color: Colors.blue);
      case NotificationType.urgent:
        return const Icon(Icons.warning, color: Colors.red);
      case NotificationType.general:
        return const Icon(Icons.info, color: Colors.grey);
    }
  }
}