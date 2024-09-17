import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure ,List<BookModel>>>fetchBooks({required String text});

}
