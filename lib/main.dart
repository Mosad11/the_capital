import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_capital/src/bloc_observer.dart';
import 'package:the_capital/core/networking/cache_helper.dart';
import 'package:the_capital/core/networking/dio_helper.dart';
import 'package:the_capital/src/root/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await ChacheHelper.init();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const AppRoot());
}
