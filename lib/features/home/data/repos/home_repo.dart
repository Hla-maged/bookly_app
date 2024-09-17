import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure ,List<BookModel>>>fetchBooksListView();
  Future<Either<Failure ,List<BookModel>>>fetchNewestListView();
  Future<Either<Failure ,List<BookModel>>>fetchSimilarListView({required String categories});
}
