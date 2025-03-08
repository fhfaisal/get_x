

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../entities/search_data.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchData>> search({required Map<String,dynamic>values});
}