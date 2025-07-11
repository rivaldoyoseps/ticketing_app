import 'package:equatable/equatable.dart';

abstract class TicketListEvent extends Equatable {
  const TicketListEvent();

  @override
  List<Object?> get props => [];
}

class LoadTicketsEvent extends TicketListEvent {
  const LoadTicketsEvent();
}

class RefreshTicketsEvent extends TicketListEvent {
  const RefreshTicketsEvent();
}

class FilterTicketsEvent extends TicketListEvent {
  final String? status;
  final String? priority;
  final String? searchQuery;
  final int? tabIndex;

  const FilterTicketsEvent({
    this.status,
    this.priority,
    this.searchQuery,
    this.tabIndex,
  });

  @override
  List<Object?> get props => [status, priority, searchQuery, tabIndex];
}

class SearchTicketsEvent extends TicketListEvent {
  final String query;

  const SearchTicketsEvent(this.query);

  @override
  List<Object> get props => [query];
}
