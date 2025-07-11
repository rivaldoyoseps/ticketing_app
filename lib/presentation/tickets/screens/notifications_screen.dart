import 'package:flutter/material.dart';
import '../../../core/utils/status_helper.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../data/repositories/ticket_repository.dart';
import '../../../data/models/notification_item_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationItem> _notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  void _loadNotifications() {
    setState(() {
      _notifications = TicketRepository.getNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadNotifications,
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No notifications',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: StatusHelper.getNotificationColor(
                        notification.type,
                      ).withValues(alpha: 0.1),
                      child: Icon(
                        StatusHelper.getNotificationIcon(notification.type),
                        color: StatusHelper.getNotificationColor(
                          notification.type,
                        ),
                      ),
                    ),
                    title: Text(
                      notification.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notification.message),
                        const SizedBox(height: 4),
                        Text(
                          DateFormatter.formatDateTime(notification.timestamp),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    trailing: notification.isRead
                        ? null
                        : Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                    onTap: () => _markAsRead(notification),
                  ),
                );
              },
            ),
    );
  }

  void _markAsRead(NotificationItem notification) {
    // In a real app, this would update the notification status
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Notification: ${notification.title}')),
    );
  }
}
