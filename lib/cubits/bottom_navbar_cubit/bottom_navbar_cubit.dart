import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_capital/cubits/bottom_navbar_cubit/bottom_navbar_states.dart';
import 'package:the_capital/view/advertisments/addvertis_screen.dart';
import 'package:the_capital/view/favorites/favorites_screen.dart';
import 'package:the_capital/view/home_screen/home_screen.dart';
import 'package:the_capital/view/settings/settings_screen.dart';

class BottomNavbarCubit extends Cubit<BottomNavbarStates> {
  BottomNavbarCubit() : super(InitialBottomNavbarState());

  static BottomNavbarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  Map<int, bool> favorites = {};

  List<Widget> bottomNavbarScreens = [
    const HomeScreen(),
    const FavorietsScreen(),
    const AddvertiesmentScreen(),
    const SettingsScreen()
  ];

  List<BottomNavigationBarItem> bottomNavbarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    BottomNavigationBarItem(
        icon: Icon(Icons.announcement), label: 'Advertisements'),
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Settings'),
  ];

  void changeBottomNavbar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavbarState());
  }
}
