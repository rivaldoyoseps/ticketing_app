import 'package:flutter/material.dart';

class StatusHelper {
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
      case 'resolved':
      case 'closed':
        return Colors.green;
      case 'in progress':
        return Colors.orange;
      case 'pending':
      case 'open':
      case 'arrive':
      case 'depart':
        return Colors.blue;
      case 'scheduled':
      case 'accepted':
        return Colors.purple;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  static IconData getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
      case 'resolved':
      case 'closed':
        return Icons.check_circle;
      case 'in progress':
        return Icons.work;
      case 'pending':
      case 'open':
        return Icons.pending;
      case 'scheduled':
        return Icons.schedule;
      case 'cancelled':
        return Icons.cancel;
      case 'arrive':
        return Icons.location_on;
      case 'depart':
        return Icons.directions_car;
      case 'accepted':
        return Icons.thumb_up;
      case 'dispatched':
        return Icons.send;
      default:
        return Icons.help;
    }
  }

  static Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  static Color getActionColor(String action) {
    switch (action.toLowerCase()) {
      case 'created':
        return Colors.blue;
      case 'updated':
      case 'status changed':
        return Colors.orange;
      case 'redispatched':
        return Colors.purple;
      case 'auto status change':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  static IconData getActionIcon(String action) {
    switch (action.toLowerCase()) {
      case 'created':
        return Icons.add_circle;
      case 'updated':
      case 'status changed':
        return Icons.update;
      case 'redispatched':
        return Icons.send;
      case 'auto status change':
        return Icons.autorenew;
      default:
        return Icons.info;
    }
  }

  static Color getNotificationColor(String type) {
    switch (type) {
      case 'new_ticket':
        return Colors.blue;
      case 'status_change':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  static IconData getNotificationIcon(String type) {
    switch (type) {
      case 'new_ticket':
        return Icons.assignment;
      case 'status_change':
        return Icons.update;
      default:
        return Icons.notifications;
    }
  }
}
