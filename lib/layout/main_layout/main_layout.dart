import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_capital/core/helpers/style/icons/icons.dart';
import 'package:the_capital/cubits/bottom_navbar_cubit/bottom_navbar_cubit.dart';
import 'package:the_capital/cubits/bottom_navbar_cubit/bottom_navbar_states.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarCubit, BottomNavbarStates>(
      builder: (context, state) {
        var cubit = BottomNavbarCubit.get(context);
        return Scaffold(
            appBar: _buildHomeAppBar(context),
            body: cubit.bottomNavbarScreens[cubit.currentIndex],
            bottomNavigationBar: _buildBottomNavigationBar(cubit));
      },
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(cubit) => BottomNavigationBar(
        items: cubit.bottomNavbarItems,
        currentIndex: cubit.currentIndex,
        onTap: (int index) {
          cubit.changeBottomNavbar(index);
        },
        // backgroundColor: Colors.white,
        // unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: const Color(0xff5078fe),
      );

  AppBar _buildHomeAppBar(BuildContext context) => AppBar(
        // foregroundColor: const Color(0xff00BCD4),
        // backgroundColor: Colors.white,
        title: const Text(
          "The Capital",
          // style: TextStyle(
          //   color: Color(0xff00BCD4),
          //   fontSize: 20,
          //   letterSpacing: 1.2,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              IconBroken.Notification,
              size: 30,
            )),
        //  IconButton(
        //     onPressed: () {
        //       // ChacheHelper.removeData(key: 'token').then((value) {
        //       //   if (value) {
        //       //     navigateAndFinish(context, LoginScreen());
        //       //   }
        //       // });
        //     },
        //     icon: const Icon(
        //       Icons.notifications,
        //       // color: Colors.white,
        //       // size: 32,
        //     )),
        actions: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AnimSearchBar(
                width: 420,
                // autoFocus: true,
                boxShadow: false,
                color: const Color(0xff00BCD4),

                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 32,
                ),
                rtl: true,
                searchIconColor: Colors.white,
                textController: searchController,
                onSubmitted: (value) {
                  // if (formKey.currentState!.validate()) {
                  //   SearchCubit.get(context)
                  //       .search(searchController.text);
                  // }
                },
                onSuffixTap: () {
                  setState(() {
                    searchController.clear();
                  });
                },
              ),
            ),
          ),
        ],
      );
}
