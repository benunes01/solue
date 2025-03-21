import 'package:equatable/equatable.dart';
import 'package:teste2/app/features/home/infra/models/home_model.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  final HomeResponse response;

  HomeLoadSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class HomeLoadFailure extends HomeState {
  final String message;

  HomeLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}