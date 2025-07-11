import 'user_profile_model.dart';

class Ticket {
  final int id;
  final String ticketNumberCustomer;
  final String ticketNumberSystem;
  final int fiber;
  final String fiberSpan;
  final String spanIdProject;
  final String ringId;
  final String nearendName;
  final String farendName;
  final String regional;
  final String province;
  final String capitalcity;
  final String cluster;
  final String cableInstalled;
  final String poleInstalled;
  final String closureInstalled;
  final String accInstalled;
  final String analisis;
  final String status;
  final String statusLabel;
  final DateTime startOpenTicket;
  final DateTime? endResolving;
  final String serviceAffected;
  final String rootCause;
  final String locationDetails;
  final String action;
  final List<UserProfile> pic;
  final UserProfile? acceptedBy;
  final UserProfile? assignedTo;
  final DateTime? departTime;
  final DateTime? arriveTime;

  Ticket({
    required this.id,
    required this.ticketNumberCustomer,
    required this.ticketNumberSystem,
    required this.fiber,
    required this.fiberSpan,
    required this.spanIdProject,
    required this.ringId,
    required this.nearendName,
    required this.farendName,
    required this.regional,
    required this.province,
    required this.capitalcity,
    required this.cluster,
    required this.cableInstalled,
    required this.poleInstalled,
    required this.closureInstalled,
    required this.accInstalled,
    required this.analisis,
    required this.status,
    required this.statusLabel,
    required this.startOpenTicket,
    this.endResolving,
    required this.serviceAffected,
    required this.rootCause,
    required this.locationDetails,
    required this.action,
    required this.pic,
    this.acceptedBy,
    this.assignedTo,
    this.departTime,
    this.arriveTime,
  });
}
