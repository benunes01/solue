import 'package:result_dart/result_dart.dart';
import 'package:teste2/app/features/home/domain/failures/home_failures.dart';
import 'package:teste2/app/features/home/domain/repositories/i_home_repository.dart';
import 'package:teste2/app/features/home/external/home_service.dart';
import 'package:teste2/app/features/home/infra/models/home_model.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeService service;

  HomeRepositoryImp({required this.service});

  @override
  AsyncResult<HomeResponse, HomeFailure> get() async {
    try {
      HomeResponse response = await service.get();
      return Success(response);
    } catch (e) {
      return Failure(HomeFailure(message: 'Erro ao buscar a imagem', error: e));
    }
  }
}
