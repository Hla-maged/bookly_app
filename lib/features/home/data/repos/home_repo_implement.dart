import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/helper/api_service.dart';
import 'home_repo.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiService apiService;
  HomeRepoImplement(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestListView() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=programming&Filtering=free_ebooks&Sorting=newest');
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchBooksListView() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=programming &Filtering=free_ebooks');
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarListView(
      {required String categories}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=subject:programming&Filtering=free_ebooks&sorting=relevance');
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
