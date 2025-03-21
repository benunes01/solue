import 'package:teste2/app/features/home/infra/models/home_model.dart';

abstract class IHomeService {
  Future<HomeResponse> get();
}