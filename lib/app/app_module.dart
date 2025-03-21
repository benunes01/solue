import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste2/app/core/config/client.dart';
import 'package:teste2/app/features/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(Client.new);
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
  }
}
