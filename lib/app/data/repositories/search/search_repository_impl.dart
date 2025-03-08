
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/safe_api_call.dart';
import '../../../domain/entities/search_data.dart';
import '../../../domain/repositories/search/search_repository.dart';
import '../../sources/remote/search/search_remote_data_source.dart';


class SearchRepositoryImpl implements SearchRepository{
  SearchRepositoryImpl(this.searchRemoteDataSource);
  final SearchRemoteDataSource searchRemoteDataSource;
  @override
  Future<Either<Failure, SearchData>> search({required Map<String,dynamic>values}) {
    return safeApiCall<SearchData>(() async {
      final model = await searchRemoteDataSource.search(values: values);
      return model.data != null ? model.data! : model.toEntity();
    });
  }
}