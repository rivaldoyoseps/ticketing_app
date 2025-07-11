import 'package:flutter/material.dart';
import '../../../data/models/ticket_model.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  const TicketCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TicketDetailScreen(ticket: ticket),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with ticket number and status
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ticket #${ticket.ticketNumberSystem}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(ticket.status),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      ticket.statusLabel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Location details
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${ticket.nearendName} - ${ticket.farendName}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Regional and province
              Row(
                children: [
                  Icon(Icons.business, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${ticket.regional} - ${ticket.province}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Service affected
              Row(
                children: [
                  Icon(Icons.warning, size: 16, color: Colors.orange[600]),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      'Service: ${ticket.serviceAffected}',
                      style: TextStyle(
                        color: Colors.orange[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Footer with date and assigned users
              Row(
                children: [
                  Icon(Icons.schedule, size: 16, color: Colors.grey[500]),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(ticket.startOpenTicket),
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                  const Spacer(),
                  if (ticket.pic.isNotEmpty)
                    Row(
                      children: [
                        Icon(Icons.people, size: 16, color: Colors.grey[500]),
                        const SizedBox(width: 4),
                        Text(
                          '${ticket.pic.length} PIC',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return Colors.orange;
      case 'in progress':
        return Colors.blue;
      case 'closed':
        return Colors.green;
      case 'pending':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class TicketDetailScreen extends StatelessWidget {
  final Ticket ticket;

  const TicketDetailScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket #${ticket.ticketNumberSystem}'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _getStatusColor(ticket.status),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            ticket.statusLabel,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Created: ${_formatDate(ticket.startOpenTicket)}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Location Details
            _buildDetailSection('Location Details', [
              _buildDetailItem('Near End', ticket.nearendName),
              _buildDetailItem('Far End', ticket.farendName),
              _buildDetailItem('Regional', ticket.regional),
              _buildDetailItem('Province', ticket.province),
              _buildDetailItem('Capital City', ticket.capitalcity),
              _buildDetailItem('Cluster', ticket.cluster),
            ]),

            const SizedBox(height: 16),

            // Technical Details
            _buildDetailSection('Technical Details', [
              _buildDetailItem('Fiber', ticket.fiber.toString()),
              _buildDetailItem('Fiber Span', ticket.fiberSpan),
              _buildDetailItem('Span ID Project', ticket.spanIdProject),
              _buildDetailItem('Ring ID', ticket.ringId),
              _buildDetailItem('Cable Installed', ticket.cableInstalled),
              _buildDetailItem('Pole Installed', ticket.poleInstalled),
              _buildDetailItem('Closure Installed', ticket.closureInstalled),
              _buildDetailItem('ACC Installed', ticket.accInstalled),
            ]),

            const SizedBox(height: 16),

            // Issue Details
            _buildDetailSection('Issue Details', [
              _buildDetailItem('Service Affected', ticket.serviceAffected),
              _buildDetailItem('Root Cause', ticket.rootCause),
              _buildDetailItem('Location Details', ticket.locationDetails),
              _buildDetailItem('Action', ticket.action),
              _buildDetailItem('Analysis', ticket.analisis),
            ]),

            const SizedBox(height: 16),

            // Assigned Users
            if (ticket.pic.isNotEmpty)
              _buildDetailSection(
                'Assigned Users',
                ticket.pic
                    .map((user) => _buildDetailItem('PIC', user.fullName))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return Colors.orange;
      case 'in progress':
        return Colors.blue;
      case 'closed':
        return Colors.green;
      case 'pending':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
