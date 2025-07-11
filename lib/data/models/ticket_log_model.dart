import 'user_profile_model.dart';

class TicketLog {
  final String id;
  final String ticketId;
  final UserProfile? user;
  final String action;
  final String details;
  final DateTime timestamp;
  final String? userId;
  final String? userName;

  TicketLog({
    required this.id,
    required this.ticketId,
    this.user,
    required this.action,
    required this.details,
    required this.timestamp,
    this.userId,
    this.userName,
  });
}
