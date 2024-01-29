part of 'search_page_bloc.dart';


abstract class SearchPageState extends Equatable {
  const SearchPageState();
}

class SearchPageLoading extends SearchPageState {
  const SearchPageLoading();

  @override
  List<Object> get props => [];
}


class SearchPageContent extends SearchPageState {
  final String query;

  const SearchPageContent({required this.query});

  @override
  List<Object> get props => [query];
}
