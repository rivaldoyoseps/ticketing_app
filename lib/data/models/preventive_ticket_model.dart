import 'user_profile_model.dart';

class PreventiveTicket {
  final int id;
  final List<dynamic> jobEvidences;
  final List<UserProfile> pic;
  final String ticketNumber;
  final String ringId;
  final String spanName;
  final String nearendName;
  final String farendName;
  final String regional;
  final String province;
  final String capitalcity;
  final String cluster;
  final String finding;
  final String status;
  final DateTime createdAt;
  final int fiber;

  PreventiveTicket({
    required this.id,
    required this.jobEvidences,
    required this.pic,
    required this.ticketNumber,
    required this.ringId,
    required this.spanName,
    required this.nearendName,
    required this.farendName,
    required this.regional,
    required this.province,
    required this.capitalcity,
    required this.cluster,
    required this.finding,
    required this.status,
    required this.createdAt,
    required this.fiber,
  });
}
