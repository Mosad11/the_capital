import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_capital/core/helpers/style/theme/theme.dart';
import 'package:the_capital/cubits/bottom_navbar_cubit/bottom_navbar_cubit.dart';
import 'package:the_capital/cubits/home_cubit/cubit.dart';
import 'package:the_capital/cubits/theme_cubit/theme_cubit.dart';
import 'package:the_capital/layout/main_layout/main_layout.dart';

class AppRoot extends StatelessWidget {
  final bool? isDark;
  const AppRoot({Key? key, this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // token = CacheHelper.getData(key: "token");
    // isOnBoarding = CacheHelper.getData(key: "isOnBoarding");

    // print("From Cache var $token");
    // print("From Cache var onBoarding $isOnBoarding");
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BottomNavbarCubit()),
          BlocProvider(
              create: (context) =>
                  ThemeCubit()..changeAppTheme(fromShared: isDark)),
          BlocProvider(
              create: (context) => HomeCubit()
                ..homeData()
                ..categoriesData()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            // CacheHelper.getData(key: "email") != null
            //     "? AuthCubit.get(context).userLogin("
            //         email: CacheHelper.getData(key: "email"),
            //         password: CacheHelper.getData(key: "password"))
            //     : null;
            // token = CacheHelper.getData(key: "token");

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const MainLayout(),
            );
          },
        ));
  }
}
