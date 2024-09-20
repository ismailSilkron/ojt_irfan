import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ojt_irfan/screen/home/model/category.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<InitiateApp>(_onInitiateApp);
  }

  Future<void> _onInitiateApp(
    InitiateApp event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingInitiateApp());

    await Future.delayed(const Duration(seconds: 5));

    final List<Category> categoryList = Category.getCategoryList();

    if (categoryList.isNotEmpty) {
      return emit(SuccessInitiateApp(categoryList: categoryList));
    }

    return emit(FailInitiateApp(errMsg: "Category list is empty"));
  }
}
