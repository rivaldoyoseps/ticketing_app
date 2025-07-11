import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1565C0);
  static const Color primaryDark = Color(0xFF0D47A1);
  static const Color secondary = Color(0xFF1976D2);

  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color error = Colors.red;
  static const Color info = Colors.blue;
  static const Color grey = Colors.grey;
}

class AppStrings {
  static const String appTitle = 'Enterprise Ticketing System';
  static const String appSubtitle = 'Asset Management System';

  // Login
  static const String emailLabel = 'Email';
  static const String passwordLabel = 'Password';
  static const String loginButton = 'LOGIN';

  // Navigation
  static const String dashboard = 'Dashboard';
  static const String tickets = 'Tickets';
  static const String notifications = 'Notifications';
  static const String profile = 'Profile';

  // Ticket Types
  static const String corrective = 'Corrective';
  static const String preventive = 'Preventive';

  // Status
  static const String all = 'All';
  static const String open = 'Open';
  static const String inProgress = 'In Progress';
  static const String pending = 'Pending';
  static const String resolved = 'Resolved';
  static const String closed = 'Closed';
  static const String arrive = 'Arrive';
  static const String depart = 'Depart';
  static const String accepted = 'Accepted';
  static const String dispatched = 'Dispatched';
}

class AppIcons {
  static const IconData dashboard = Icons.dashboard;
  static const IconData tickets = Icons.confirmation_number;
  static const IconData notifications = Icons.notifications;
  static const IconData profile = Icons.person;
  static const IconData business = Icons.business;
  static const IconData email = Icons.email;
  static const IconData lock = Icons.lock;
  static const IconData visibility = Icons.visibility;
  static const IconData visibilityOff = Icons.visibility_off;
}
