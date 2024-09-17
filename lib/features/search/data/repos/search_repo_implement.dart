import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/helper/api_service.dart';

class SearchRepoImplement implements SearchRepo {
  final ApiService apiService;
  SearchRepoImplement(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchBooks(
      {required String text}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=$text&Filtering=free_ebooks');
      List<BookModel> Books = [];
      for (var item in data['items']) {
        Books.add(BookModel.fromJson(item));
      }
      return right(Books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
