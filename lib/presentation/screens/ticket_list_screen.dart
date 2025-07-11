import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tickets/ticket_list_bloc.dart';
import '../bloc/tickets/ticket_list_event.dart';
import '../bloc/tickets/ticket_list_state.dart';
import '../shared_widgets/ticket_card.dart';

class TicketListScreen extends StatelessWidget {
  const TicketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<TicketListBloc>().add(const RefreshTicketsEvent());
            },
          ),
        ],
      ),
      body: BlocBuilder<TicketListBloc, TicketListState>(
        builder: (context, state) {
          if (state is TicketListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TicketListError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.message}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TicketListBloc>().add(
                        const LoadTicketsEvent(),
                      );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (state is TicketListLoaded) {
            return Column(
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search tickets...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (query) {
                      context.read<TicketListBloc>().add(
                        SearchTicketsEvent(query),
                      );
                    },
                  ),
                ),
                // Filter chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      FilterChip(
                        label: const Text('All'),
                        selected: state.statusFilter == null,
                        onSelected: (selected) {
                          context.read<TicketListBloc>().add(
                            const FilterTicketsEvent(status: null),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: const Text('Open'),
                        selected: state.statusFilter == 'Open',
                        onSelected: (selected) {
                          context.read<TicketListBloc>().add(
                            const FilterTicketsEvent(status: 'Open'),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: const Text('In Progress'),
                        selected: state.statusFilter == 'In Progress',
                        onSelected: (selected) {
                          context.read<TicketListBloc>().add(
                            const FilterTicketsEvent(status: 'In Progress'),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: const Text('Closed'),
                        selected: state.statusFilter == 'Closed',
                        onSelected: (selected) {
                          context.read<TicketListBloc>().add(
                            const FilterTicketsEvent(status: 'Closed'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Ticket list
                Expanded(
                  child: state.filteredTickets.isEmpty
                      ? const Center(
                          child: Text(
                            'No tickets found',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemCount: state.filteredTickets.length,
                          itemBuilder: (context, index) {
                            final ticket = state.filteredTickets[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TicketCard(ticket: ticket),
                            );
                          },
                        ),
                ),
              ],
            );
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}
