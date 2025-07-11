import 'package:flutter/material.dart';
import '../../../core/utils/status_helper.dart';
import '../../../data/models/ticket_model.dart';

class TicketDetailScreen extends StatelessWidget {
  final Ticket ticket;

  const TicketDetailScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Detail'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editTicket(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: StatusHelper.getStatusColor(
                        ticket.status,
                      ).withValues(alpha: 0.1),
                      child: Icon(
                        StatusHelper.getStatusIcon(ticket.status),
                        color: StatusHelper.getStatusColor(ticket.status),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket.status,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ticket.statusLabel,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Ticket Information
            _buildInfoSection(
              title: 'Ticket Information',
              children: [
                _buildInfoRow('Ticket Number', ticket.ticketNumberSystem),
                _buildInfoRow('Customer Number', ticket.ticketNumberCustomer),
                _buildInfoRow('Fiber', ticket.fiber.toString()),
                _buildInfoRow('Ring ID', ticket.ringId),
                _buildInfoRow('Span ID', ticket.spanIdProject),
              ],
            ),
            const SizedBox(height: 16),

            // Location Information
            _buildInfoSection(
              title: 'Location Information',
              children: [
                _buildInfoRow('Near End', ticket.nearendName),
                _buildInfoRow('Far End', ticket.farendName),
                _buildInfoRow('Regional', ticket.regional),
                _buildInfoRow('Province', ticket.province),
                _buildInfoRow('City', ticket.capitalcity),
                _buildInfoRow('Cluster', ticket.cluster),
              ],
            ),
            const SizedBox(height: 16),

            // Technical Information
            _buildInfoSection(
              title: 'Technical Information',
              children: [
                _buildInfoRow('Fiber Span', ticket.fiberSpan),
                _buildInfoRow(
                  'Cable Installed',
                  ticket.cableInstalled.isEmpty ? 'N/A' : ticket.cableInstalled,
                ),
                _buildInfoRow(
                  'Pole Installed',
                  ticket.poleInstalled.isEmpty ? 'N/A' : ticket.poleInstalled,
                ),
                _buildInfoRow(
                  'Closure Installed',
                  ticket.closureInstalled.isEmpty
                      ? 'N/A'
                      : ticket.closureInstalled,
                ),
                _buildInfoRow(
                  'ACC Installed',
                  ticket.accInstalled.isEmpty ? 'N/A' : ticket.accInstalled,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Timeline Information
            _buildInfoSection(
              title: 'Timeline',
              children: [
                _buildInfoRow(
                  'Start Time',
                  _formatDateTime(ticket.startOpenTicket),
                ),
                if (ticket.departTime != null)
                  _buildInfoRow(
                    'Depart Time',
                    _formatDateTime(ticket.departTime!),
                  ),
                if (ticket.arriveTime != null)
                  _buildInfoRow(
                    'Arrive Time',
                    _formatDateTime(ticket.arriveTime!),
                  ),
                if (ticket.endResolving != null)
                  _buildInfoRow(
                    'End Time',
                    _formatDateTime(ticket.endResolving!),
                  ),
              ],
            ),
            const SizedBox(height: 16),

            // PIC Information
            if (ticket.pic.isNotEmpty)
              _buildInfoSection(
                title: 'Person in Charge',
                children: ticket.pic
                    .map((user) => _buildInfoRow('PIC', user.fullName))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  void _editTicket(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Edit ticket feature will be implemented soon.'),
      ),
    );
  }
}
