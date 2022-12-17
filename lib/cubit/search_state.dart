part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Doctor> results;

  const SearchSuccess(this.results);

  @override
  // TODO: implement props
  List<Object> get props => [results];
}

class SearchFailed extends SearchState {
  final String error;
  const SearchFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
