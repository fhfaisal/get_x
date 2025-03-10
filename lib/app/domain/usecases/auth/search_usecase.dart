
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/repositories/search/search_repository_impl.dart';

import '../../../../core/error/failures.dart';
import '../../entities/search_data.dart';
import '../../repositories/search/search_repository.dart';

class SearchUseCase{
  static SearchUseCase get instance=>Get.find();
  final SearchRepository searchRepository=SearchRepositoryImpl();
  Future<Either<Failure, SearchData>> search({required Map<String,dynamic>values}){
    return searchRepository.search(values: values);
  }
}