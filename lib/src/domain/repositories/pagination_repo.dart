import 'package:cct_core/src/domain/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class PaginationRepo<T> {
  int _currentPage = 1;
  final int _itemsPerPage;

  PaginationRepo({int itemsPerPage = 10}) : _itemsPerPage = itemsPerPage;

  @protected
  Future<Either<Failure, List<T>>> fetchData(int skip, int take);

  Future<Either<Failure, List<T>>> getNextPage() async {
    final skip = (_currentPage - 1) * _itemsPerPage;
    final take = _itemsPerPage;

    final result = await fetchData(skip, take);

    _currentPage++;

    return result;
  }

  Future<Either<Failure, List<T>>> refresh() async {
    _currentPage = 1;
    return getNextPage();
  }
}
