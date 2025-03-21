import 'package:result_dart/result_dart.dart';
import 'package:teste2/app/core/utils/i_usecase.dart';
import 'package:teste2/app/features/home/domain/failures/home_failures.dart';
import 'package:teste2/app/features/home/domain/repositories/i_home_repository.dart';
import 'package:teste2/app/features/home/infra/models/home_model.dart';

class GetHomeUseCase extends IUsecase{
  final HomeRepository _repository;

  GetHomeUseCase(this._repository);

  @override
  AsyncResult<HomeResponse, HomeFailure> call(params) async {
    try {
      final result = await _repository.get();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
