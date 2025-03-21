import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste2/app/core/config/client.dart';
import 'package:teste2/app/features/home/domain/repositories/i_home_repository.dart';
import 'package:teste2/app/features/home/domain/usecases/get_home_usecase.dart';
import 'package:teste2/app/features/home/external/home_service.dart';
import 'package:teste2/app/features/home/external/i_home_service.dart';
import 'package:teste2/app/features/home/infra/repositories/home_repository.dart';
import 'package:teste2/app/features/home/presenter/pages/home_page.dart';
import 'package:teste2/app/features/home/presenter/stores/home_store.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(Client.new);

    i.add<HomeRepository>(HomeRepositoryImp.new);
    i.add<IHomeService>(HomeService.new);
    i.add(GetHomeUseCase.new);
    i.addSingleton(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
  }
}
