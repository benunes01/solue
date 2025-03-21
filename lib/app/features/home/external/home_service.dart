import 'package:teste2/app/core/config/client.dart';
import 'package:teste2/app/features/home/external/i_home_service.dart';
import 'package:teste2/app/features/home/infra/models/home_model.dart';

class HomeService extends IHomeService {
  final Client client;

  HomeService({required this.client});

  @override
  Future<HomeResponse> get() async {
    try {
      final response = await client.dio.get('');
      return HomeResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
