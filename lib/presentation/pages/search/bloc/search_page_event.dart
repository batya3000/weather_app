part of 'search_page_bloc.dart';

abstract class SearchPageEvent extends Equatable {
  const SearchPageEvent();

}


class QueryChangedEvent extends SearchPageEvent {
  final String newQuery;

  const QueryChangedEvent(this.newQuery);

  @override
  List<Object?> get props => [newQuery];

}


