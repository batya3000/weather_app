
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {

  SearchPageBloc() : super(const SearchPageLoading()) {
    on<QueryChangedEvent>(_onQueryChanged);
  }

  void _onQueryChanged(QueryChangedEvent event, Emitter<SearchPageState> emit) {
    emit(SearchPageContent(query: event.newQuery));
  }


}
