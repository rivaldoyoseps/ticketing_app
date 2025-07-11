class NotificationItem {
  final String id;
  final String title;
  final String message;
  final String? ticketId;
  final DateTime timestamp;
  final bool isRead;
  final String
  type; // 'new_ticket', 'status_change', 'completion', 'preventive_task', 'system_alert'

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    this.ticketId,
    required this.timestamp,
    required this.isRead,
    required this.type,
  });
}
