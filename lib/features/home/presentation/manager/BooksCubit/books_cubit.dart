import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.homeRepo) : super(BooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchBooksListView() async {
    emit(BooksInitial());
    var result = await homeRepo.fetchBooksListView();
    result.fold((failure) {
      emit(BooksFailure(failure.errMessage));
    }, (books) {
      emit(BooksSuccess(books));
    });
  }
}
