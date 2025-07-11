import '../models/ticket_model.dart';
import '../models/preventive_ticket_model.dart';
import '../models/user_profile_model.dart';
import '../models/ticket_log_model.dart';
import '../models/notification_item_model.dart';

class TicketRepository {
  static List<UserProfile> getPicUsers() {
    return [
      UserProfile(
        id: 6764,
        username: "agung",
        firstName: "",
        lastName: "",
        fullName: "agung",
      ),
      UserProfile(
        id: 6762,
        username: "yuswanto",
        firstName: "",
        lastName: "",
        fullName: "yuswanto",
      ),
      UserProfile(
        id: 6761,
        username: "iputudidikr",
        firstName: "",
        lastName: "",
        fullName: "iputudidikr",
      ),
      UserProfile(
        id: 6765,
        username: "nazmi",
        firstName: "",
        lastName: "",
        fullName: "nazmi",
      ),
      UserProfile(
        id: 6763,
        username: "eggie",
        firstName: "",
        lastName: "",
        fullName: "eggie",
      ),
    ];
  }

  Future<List<Ticket>> getTickets() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    return getCorrectiveTickets();
  }

  static List<Ticket> getCorrectiveTickets() {
    final picUsers = getPicUsers();
    return [
      Ticket(
        id: 24,
        ticketNumberCustomer: "TT-Test3",
        ticketNumberSystem: "CM-20250630-0002",
        fiber: 137,
        fiberSpan: "S000000088 (KARANG KECICANG <> PANARAGA DASAN CERMEN)",
        spanIdProject: "NB_MTR_RG0003_SE00010",
        ringId: "NB_MTR_RG0003",
        nearendName: "KARANG KECICANG",
        farendName: "PANARAGA DASAN CERMEN",
        regional: "3",
        province: "NTB",
        capitalcity: "Mataram",
        cluster: "MATARAM 3",
        cableInstalled: "",
        poleInstalled: "",
        closureInstalled: "",
        accInstalled: "",
        analisis: "",
        status: "Closed",
        statusLabel: "Closed",
        startOpenTicket: DateTime.parse("2025-06-30T17:42:43+07:00"),
        endResolving: DateTime.parse("2025-07-06T07:32:00+07:00"),
        serviceAffected: "",
        rootCause: "",
        locationDetails: "",
        action: "",
        pic: picUsers,
        acceptedBy: null,
        assignedTo: null,
        departTime: DateTime.parse("2025-06-30T19:47:39.509500+07:00"),
        arriveTime: DateTime.parse("2025-06-30T20:21:14.650836+07:00"),
      ),
      Ticket(
        id: 30,
        ticketNumberCustomer: "TT-Test5",
        ticketNumberSystem: "CM-20250704-0001",
        fiber: 136,
        fiberSpan: "S000000087 (BERTAIS <> KARANG KECICANG)",
        spanIdProject: "NB_MTR_RG0003_SE00009",
        ringId: "NB_MTR_RG0003",
        nearendName: "BERTAIS",
        farendName: "KARANG KECICANG",
        regional: "3",
        province: "NTB",
        capitalcity: "Mataram",
        cluster: "MATARAM 3",
        cableInstalled: "",
        poleInstalled: "",
        closureInstalled: "",
        accInstalled: "",
        analisis: "",
        status: "Arrive",
        statusLabel: "Arrive",
        startOpenTicket: DateTime.parse("2025-07-04T11:34:47+07:00"),
        endResolving: null,
        serviceAffected: "",
        rootCause: "",
        locationDetails: "",
        action: "",
        pic: picUsers,
        acceptedBy: null,
        assignedTo: null,
        departTime: DateTime.parse("2025-07-06T18:58:44.353085+07:00"),
        arriveTime: DateTime.parse("2025-07-06T19:00:10.965322+07:00"),
      ),
    ];
  }

  static List<PreventiveTicket> getPreventiveTickets() {
    final picUsers = getPicUsers();
    return [
      PreventiveTicket(
        id: 9,
        jobEvidences: [],
        pic: picUsers,
        ticketNumber: "PM-20250704-0001",
        ringId: "NB_MTR_RG0003",
        spanName: "NB_MTR_RG0003_SE00010",
        nearendName: "KARANG KECICANG",
        farendName: "PANARAGA DASAN CERMEN",
        regional: "3",
        province: "NTB",
        capitalcity: "Mataram",
        cluster: "MATARAM 3",
        finding: "",
        status: "In Progress",
        createdAt: DateTime.parse("2025-07-04T21:35:08.172031+07:00"),
        fiber: 137,
      ),
      PreventiveTicket(
        id: 7,
        jobEvidences: [],
        pic: picUsers,
        ticketNumber: "PM-20250630-0001",
        ringId: "NB_MTR_RG0003",
        spanName: "NB_MTR_RG0003_SE00009",
        nearendName: "BERTAIS",
        farendName: "KARANG KECICANG",
        regional: "3",
        province: "NTB",
        capitalcity: "Mataram",
        cluster: "MATARAM 3",
        finding: "",
        status: "Closed",
        createdAt: DateTime.parse("2025-06-30T20:45:53.233564+07:00"),
        fiber: 136,
      ),
      PreventiveTicket(
        id: 10,
        jobEvidences: [],
        pic: picUsers,
        ticketNumber: "PM-20250705-0001",
        ringId: "NB_MTR_RG0003",
        spanName: "NB_MTR_RG0003_SE00009",
        nearendName: "BERTAIS",
        farendName: "KARANG KECICANG",
        regional: "3",
        province: "NTB",
        capitalcity: "Mataram",
        cluster: "MATARAM 3",
        finding: "",
        status: "In Progress",
        createdAt: DateTime.parse("2025-07-05T20:11:39.664606+07:00"),
        fiber: 136,
      ),
    ];
  }

  static List<NotificationItem> getNotifications() {
    return [
      NotificationItem(
        id: 'N001',
        title: 'New Ticket Assigned',
        message: 'Ticket CR-005 has been assigned to you',
        ticketId: 'CR-005',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        isRead: false,
        type: 'new_ticket',
      ),
      NotificationItem(
        id: 'N002',
        title: 'Ticket Status Updated',
        message: 'Ticket CR-001 status changed to Resolved',
        ticketId: 'CR-001',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: false,
        type: 'status_change',
      ),
      NotificationItem(
        id: 'N003',
        title: 'Ticket Completed',
        message: 'Ticket CR-003 has been completed successfully',
        ticketId: 'CR-003',
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
        isRead: true,
        type: 'completion',
      ),
      NotificationItem(
        id: 'N004',
        title: 'New Preventive Task',
        message: 'New preventive maintenance task assigned',
        ticketId: 'PM-001',
        timestamp: DateTime.now().subtract(const Duration(hours: 6)),
        isRead: false,
        type: 'preventive_task',
      ),
      NotificationItem(
        id: 'N005',
        title: 'System Alert',
        message: 'System maintenance scheduled for tomorrow',
        ticketId: null,
        timestamp: DateTime.now().subtract(const Duration(hours: 8)),
        isRead: true,
        type: 'system_alert',
      ),
    ];
  }

  static List<TicketLog> getTicketLogs() {
    return [
      TicketLog(
        id: 'L001',
        ticketId: 'CR-001',
        action: 'Ticket Created',
        details: 'Ticket created by system',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        userId: 'U001',
        userName: 'John Doe',
      ),
      TicketLog(
        id: 'L002',
        ticketId: 'CR-001',
        action: 'Assigned',
        details: 'Ticket assigned to technician',
        timestamp: DateTime.now().subtract(const Duration(hours: 23)),
        userId: 'U002',
        userName: 'Jane Smith',
      ),
      TicketLog(
        id: 'L003',
        ticketId: 'CR-001',
        action: 'Status Updated',
        details: 'Status changed to In Progress',
        timestamp: DateTime.now().subtract(const Duration(hours: 22)),
        userId: 'U001',
        userName: 'John Doe',
      ),
      TicketLog(
        id: 'L004',
        ticketId: 'CR-001',
        action: 'Work Started',
        details: 'Technician arrived at location',
        timestamp: DateTime.now().subtract(const Duration(hours: 21)),
        userId: 'U001',
        userName: 'John Doe',
      ),
      TicketLog(
        id: 'L005',
        ticketId: 'CR-001',
        action: 'Work Completed',
        details: 'Repair work completed successfully',
        timestamp: DateTime.now().subtract(const Duration(hours: 20)),
        userId: 'U001',
        userName: 'John Doe',
      ),
    ];
  }
}
