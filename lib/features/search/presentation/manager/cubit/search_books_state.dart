part of 'search_books_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookModel> books;

  const SearchSuccess(this.books);
}

class SearchFailure extends SearchState {
  final String error;

  const SearchFailure(this.error);
}

