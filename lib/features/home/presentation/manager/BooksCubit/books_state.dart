part of 'books_cubit.dart';

sealed class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksSuccess extends BooksState {
  final List<BookModel> books;

  const BooksSuccess(this.books);
}

class BooksFailure extends BooksState {
  final String error;

  const BooksFailure(this.error);
}
