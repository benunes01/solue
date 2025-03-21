import 'package:result_dart/result_dart.dart';
import 'package:teste2/app/features/home/domain/failures/home_failures.dart';
import 'package:teste2/app/features/home/infra/models/home_model.dart';

abstract class HomeRepository {
  AsyncResult<HomeResponse, HomeFailure> get();
}
