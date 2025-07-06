import 'package:flutter/material.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final List<AppNotification> _notifications = [];
  final ValueNotifier<int> _unreadCount = ValueNotifier(0);

  ValueNotifier<int> get unreadCount => _unreadCount;
  List<AppNotification> get notifications => List.unmodifiable(_notifications);

  void addNotification(AppNotification notification) {
    _notifications.insert(0, notification);
    if (_notifications.length > 50) {
      _notifications.removeLast();
    }
    _updateUnreadCount();
  }

  void markAsRead(String id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
      _updateUnreadCount();
    }
  }

  void markAllAsRead() {
    for (int i = 0; i < _notifications.length; i++) {
      _notifications[i] = _notifications[i].copyWith(isRead: true);
    }
    _updateUnreadCount();
  }

  void _updateUnreadCount() {
    _unreadCount.value = _notifications.where((n) => !n.isRead).length;
  }

  void notifyNewPatient(String patientName) {
    addNotification(AppNotification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Novo Paciente',
      message: '$patientName foi adicionado à fila',
      type: NotificationType.newPatient,
      timestamp: DateTime.now(),
    ));
  }

  void notifyTriageCompleted(String patientName) {
    addNotification(AppNotification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Triagem Concluída',
      message: 'Triagem de $patientName foi finalizada',
      type: NotificationType.triageCompleted,
      timestamp: DateTime.now(),
    ));
  }

  void notifyUrgentCase(String patientName) {
    addNotification(AppNotification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'CASO URGENTE',
      message: '$patientName requer atenção imediata',
      type: NotificationType.urgent,
      timestamp: DateTime.now(),
    ));
  }
}

class AppNotification {
  final String id;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime timestamp;
  final bool isRead;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.timestamp,
    this.isRead = false,
  });

  AppNotification copyWith({
    String? id,
    String? title,
    String? message,
    NotificationType? type,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return AppNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}

enum NotificationType {
  newPatient,
  triageCompleted,
  urgent,
  general,
}