import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repositories/ticket_repository.dart';
import '../../../../data/models/ticket_model.dart';
import 'ticket_list_event.dart';
import 'ticket_list_state.dart';

class TicketListBloc extends Bloc<TicketListEvent, TicketListState> {
  final TicketRepository _ticketRepository;

  TicketListBloc({TicketRepository? ticketRepository})
    : _ticketRepository = ticketRepository ?? TicketRepository(),
      super(TicketListInitial()) {
    on<LoadTicketsEvent>(_onLoadTickets);
    on<RefreshTicketsEvent>(_onRefreshTickets);
    on<FilterTicketsEvent>(_onFilterTickets);
    on<SearchTicketsEvent>(_onSearchTickets);
  }

  Future<void> _onLoadTickets(
    LoadTicketsEvent event,
    Emitter<TicketListState> emit,
  ) async {
    emit(TicketListLoading());
    try {
      final tickets = await _ticketRepository.getTickets();
      emit(TicketListLoaded(tickets: tickets, filteredTickets: tickets));
    } catch (e) {
      emit(TicketListError(e.toString()));
    }
  }

  Future<void> _onRefreshTickets(
    RefreshTicketsEvent event,
    Emitter<TicketListState> emit,
  ) async {
    if (state is TicketListLoaded) {
      final currentState = state as TicketListLoaded;
      emit(TicketListLoading());
      try {
        final tickets = await _ticketRepository.getTickets();
        emit(
          TicketListLoaded(
            tickets: tickets,
            filteredTickets: tickets,
            searchQuery: currentState.searchQuery,
            statusFilter: currentState.statusFilter,
            priorityFilter: currentState.priorityFilter,
          ),
        );
      } catch (e) {
        emit(TicketListError(e.toString()));
      }
    }
  }

  void _onFilterTickets(
    FilterTicketsEvent event,
    Emitter<TicketListState> emit,
  ) {
    if (state is TicketListLoaded) {
      final currentState = state as TicketListLoaded;
      List<Ticket> filteredTickets = currentState.tickets;

      // Apply status filter
      if (event.status != null && event.status!.isNotEmpty) {
        filteredTickets = filteredTickets
            .where((ticket) => ticket.status == event.status)
            .toList();
      }

      // Apply priority filter (assuming priority is part of status or separate field)
      if (event.priority != null && event.priority!.isNotEmpty) {
        // Add priority filtering logic here if needed
      }

      // Apply search query
      if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
        filteredTickets = filteredTickets
            .where(
              (ticket) =>
                  ticket.ticketNumberCustomer.toLowerCase().contains(
                    event.searchQuery!.toLowerCase(),
                  ) ||
                  ticket.ticketNumberSystem.toLowerCase().contains(
                    event.searchQuery!.toLowerCase(),
                  ) ||
                  ticket.nearendName.toLowerCase().contains(
                    event.searchQuery!.toLowerCase(),
                  ) ||
                  ticket.farendName.toLowerCase().contains(
                    event.searchQuery!.toLowerCase(),
                  ),
            )
            .toList();
      }

      emit(
        currentState.copyWith(
          filteredTickets: filteredTickets,
          statusFilter: event.status,
          priorityFilter: event.priority,
          searchQuery: event.searchQuery,
        ),
      );
    }
  }

  void _onSearchTickets(
    SearchTicketsEvent event,
    Emitter<TicketListState> emit,
  ) {
    if (state is TicketListLoaded) {
      final currentState = state as TicketListLoaded;
      List<Ticket> filteredTickets = currentState.tickets;

      if (event.query.isNotEmpty) {
        filteredTickets = filteredTickets
            .where(
              (ticket) =>
                  ticket.ticketNumberCustomer.toLowerCase().contains(
                    event.query.toLowerCase(),
                  ) ||
                  ticket.ticketNumberSystem.toLowerCase().contains(
                    event.query.toLowerCase(),
                  ) ||
                  ticket.nearendName.toLowerCase().contains(
                    event.query.toLowerCase(),
                  ) ||
                  ticket.farendName.toLowerCase().contains(
                    event.query.toLowerCase(),
                  ),
            )
            .toList();
      }

      emit(
        currentState.copyWith(
          filteredTickets: filteredTickets,
          searchQuery: event.query.isEmpty ? null : event.query,
        ),
      );
    }
  }
}
