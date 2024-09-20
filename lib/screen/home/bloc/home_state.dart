part of 'home_bloc.dart';

@immutable
class HomeState {}

class HomeInitial extends HomeState {}

class LoadingInitiateApp extends HomeState {}

class SuccessInitiateApp extends HomeState {
  final List<Category> categoryList;

  SuccessInitiateApp({required this.categoryList});
}

class FailInitiateApp extends HomeState {
  final String errMsg;

  FailInitiateApp({required this.errMsg});
}
