import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_capital/cubits/home_cubit/cubit.dart';
import 'package:the_capital/cubits/home_cubit/states.dart';
import 'package:the_capital/models/home/home_model.dart';

class AddvertiesmentScreen extends StatelessWidget {
  const AddvertiesmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..categoriesData()
        ..homeData(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
              body: ConditionalBuilder(
                  condition:
                      cubit.categoriyModel != null && cubit.homeModel != null,
                  builder: (context) =>
                      listitembuilder(cubit.homeModel!, context),
                  fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      )));
        },
      ),
    );
  }
}

Widget listitembuilder(HomeModel model, context) {
  return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: ((context, index) {
        return carditem(model, context);
      }),
      separatorBuilder: (context, index) => const SizedBox(
            height: 2,
          ),
      itemCount: 10);
}

Widget carditem(HomeModel model, context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
    child: SizedBox(
      width: double.infinity,
      height: 300,
      child: Card(
          elevation: 2,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Image(
              image: NetworkImage(
                  "https://b1810978.smushcdn.com/1810978/wp-content/uploads/2023/02/NewfoundlandWolf-e1675969774140.jpg?lossy=1&strip=1&webp=1"),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.favorite)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_outlined)),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Text(
                    "MyStringsSample card text MyStringsSample card textMyStringsSample card text",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Location',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Call ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          "Read More>>",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            )
          ])),
    ),
  );
}
