import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_capital/core/networking/cache_helper.dart';
import 'package:the_capital/cubits/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(InitialThemeState());

  static ThemeCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeAppTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppThemeState());
    } else {
      isDark = !isDark;
      ChacheHelper.putBolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppThemeState());
      });
    }
  }
}
