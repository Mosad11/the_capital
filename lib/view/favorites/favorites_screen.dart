import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_capital/cubits/home_cubit/cubit.dart';
import 'package:the_capital/cubits/home_cubit/states.dart';

class FavorietsScreen extends StatefulWidget {
  const FavorietsScreen({Key? key}) : super(key: key);

  @override
  State<FavorietsScreen> createState() => _FavorietsScreenState();
}

class _FavorietsScreenState extends State<FavorietsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController? controller = TabController(length: 2, vsync: this);
    return BlocProvider(
      create: (context) => HomeCubit()
        ..categoriesData()
        ..homeData(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          // AlKayanCubit cubit = AlKayanCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                  tabAlignment: TabAlignment.center,
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: controller,
                  // dividerColor: Colors.black,
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                          ),
                          Text("Services"),
                          SizedBox(
                            width: 60,
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                          ),
                          Text("Addvertiesment"),
                          SizedBox(
                            width: 60,
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TabBarView(controller: controller, children: [
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          return carditemServices(context);
                        }),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 2,
                            ),
                        itemCount: 10),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          return carditemAdd(context);
                        }),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 2,
                            ),
                        itemCount: 10),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget carditemServices(context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
    child: SizedBox(
      width: double.infinity,
      height: 250,
      child: Card(
          elevation: 2,
          semanticContainer: true,
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  const Image(
                    image: NetworkImage(
                        "https://b1810978.smushcdn.com/1810978/wp-content/uploads/2023/02/NewfoundlandWolf-e1675969774140.jpg?lossy=1&strip=1&webp=1"),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Title",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber,
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
                                      backgroundColor: Colors.blue,
                                      elevation: 0,
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Call ',
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
                                      'WhatsApp ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share_outlined,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          )),
                    ],
                  ),
                ),
              )
            ],
          )),
    ),
  );
}

Widget carditemAdd(context) {
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
