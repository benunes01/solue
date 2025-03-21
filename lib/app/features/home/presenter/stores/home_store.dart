import 'package:bloc/bloc.dart';
import 'package:teste2/app/features/home/domain/usecases/get_home_usecase.dart';
import 'package:teste2/app/features/home/presenter/state/home_state.dart';

class HomeStore extends Cubit<HomeState> {
  final GetHomeUseCase _getHomeUseCase;

  HomeStore(this._getHomeUseCase) : super(HomeLoadInProgress()) {
    _init();
  }

  Future<void> _init() async {
    await get();
  }

  Future<void> get() async {
    emit(HomeLoadInProgress());

    final result = await _getHomeUseCase.call(null);
    result.fold(
          (success) => emit(HomeLoadSuccess(success)),
          (failure) => emit(HomeLoadFailure('Erro ao buscar a imagem')),
    );
  }
}