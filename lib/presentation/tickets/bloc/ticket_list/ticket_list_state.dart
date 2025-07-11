import 'package:equatable/equatable.dart';
import '../../../../data/models/ticket_model.dart';

abstract class TicketListState extends Equatable {
  const TicketListState();

  @override
  List<Object?> get props => [];
}

class TicketListInitial extends TicketListState {}

class TicketListLoading extends TicketListState {}

class TicketListLoaded extends TicketListState {
  final List<Ticket> tickets;
  final List<Ticket> filteredTickets;
  final String? searchQuery;
  final String? statusFilter;
  final String? priorityFilter;

  const TicketListLoaded({
    required this.tickets,
    required this.filteredTickets,
    this.searchQuery,
    this.statusFilter,
    this.priorityFilter,
  });

  @override
  List<Object?> get props => [
    tickets,
    filteredTickets,
    searchQuery,
    statusFilter,
    priorityFilter,
  ];

  TicketListLoaded copyWith({
    List<Ticket>? tickets,
    List<Ticket>? filteredTickets,
    String? searchQuery,
    String? statusFilter,
    String? priorityFilter,
  }) {
    return TicketListLoaded(
      tickets: tickets ?? this.tickets,
      filteredTickets: filteredTickets ?? this.filteredTickets,
      searchQuery: searchQuery ?? this.searchQuery,
      statusFilter: statusFilter ?? this.statusFilter,
      priorityFilter: priorityFilter ?? this.priorityFilter,
    );
  }
}

class TicketListError extends TicketListState {
  final String message;

  const TicketListError(this.message);

  @override
  List<Object> get props => [message];
}
