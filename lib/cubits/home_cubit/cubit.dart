import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_capital/core/networking/dio_helper.dart';
import 'package:the_capital/cubits/home_cubit/states.dart';
import 'package:the_capital/models/categories/categories_model.dart';
import 'package:the_capital/models/home/home_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  void homeData() {
    emit(HomeLoadingState());
    DioHelper.getData(
      url: 'home',
      // token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      // homeModel!.data!.products!.forEach((element) {
      //   favorites.addAll(({element.id!: element.in_favorites!}));
      // });
      // print(favorites.toString());
      // print(homeModel!.status);
      emit(HomeSuccessState());
    }).catchError((error) {
      emit(HomeErrorState());
    });
  }

  CategoriesModel? categoriyModel;
  void categoriesData() {
    DioHelper.getData(
      url: 'categories',
      // token: token,
    ).then((value) {
      categoriyModel = CategoriesModel.fromJson(value.data);

      emit(HomeCategoriesSuccessState());
    }).catchError((error) {
      emit(HomeCategoriesErrorState());
    });
  }
}
