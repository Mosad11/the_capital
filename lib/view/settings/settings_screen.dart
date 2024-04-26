import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;
  bool isDarkMood = false;
  bool isEnglish = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xff00BCD4), width: 2)),
                    child: Center(
                        child: Image.asset('assets/images/facebook.png')),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mossad Selim",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "01060056199",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text("Edit profile",
                          style: TextStyle(
                            color: Color(0xff00BCD4),
                          )))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(),
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              dense: true,
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              dense: true,
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add your advertise'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              dense: true,
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(),
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text('Contact Us'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              dense: true,
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(),
            ),
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text('terms & conditions'),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              dense: true,
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(),
            ),
            ListTile(
              leading: const Icon(Icons.notifications_active_outlined),
              title: const Text('Notification'),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    isSwitched = !isSwitched;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 375),
                  height: 30,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: isSwitched ? Colors.grey : const Color(0xff00BCD4),
                  ),
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 375),
                        curve: Curves.easeIn,
                        top: 3.0,
                        left: isSwitched ? 38.0 : 0.0,
                        right: isSwitched ? 0.0 : 38.0,
                        child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 375),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return RotationTransition(
                                turns: animation,
                                child: child,
                              );
                            },
                            child: isSwitched
                                ? Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.white,
                                    key: UniqueKey(),
                                  )
                                : Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                    key: UniqueKey(),
                                  )),
                      ),
                    ],
                  ),
                ),
              ),
              dense: true,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(),
            ),
            ListTile(
              leading: const Icon(Icons.mode_night_sharp),
              title: const Text('Theme'),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    isDarkMood = !isDarkMood;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 375),
                  height: 30,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: isSwitched ? Colors.black : Color(0xff00BCD4),
                  ),
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 375),
                        curve: Curves.easeIn,
                        top: 3.0,
                        left: isSwitched ? 38.0 : 0.0,
                        right: isSwitched ? 0.0 : 38.0,
                        child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 375),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return RotationTransition(
                                turns: animation,
                                child: child,
                              );
                            },
                            child: isSwitched
                                ? Icon(
                                    Icons.dark_mode,
                                    color: Colors.white,
                                    key: UniqueKey(),
                                  )
                                : Icon(
                                    Icons.light_mode,
                                    color: Colors.white,
                                    key: UniqueKey(),
                                  )),
                      ),
                    ],
                  ),
                ),
              ),
              dense: true,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    isEnglish = !isEnglish;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 375),
                  height: 30,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: isSwitched
                        ? const Color(0xff00BCD4)
                        : const Color(0xff00BCD4),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 375),
                        curve: Curves.easeIn,
                        top: 3.0,
                        left: isSwitched ? 38.0 : 0.0,
                        right: isSwitched ? 0.0 : 38.0,
                        child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 375),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return RotationTransition(
                                turns: animation,
                                child: child,
                              );
                            },
                            child: isSwitched
                                ? Icon(
                                    Icons.language,
                                    color: Colors.white,
                                    key: UniqueKey(),
                                  )
                                : Icon(
                                    Icons.layers_rounded,
                                    color: Colors.white,
                                    key: UniqueKey(),
                                  )),
                      ),
                    ],
                  ),
                ),
              ),
              dense: true,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 55,
                  width: 70,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xff00BCD4),
                      )),
                  child:
                      Center(child: Image.asset('assets/images/facebook.png')),
                ),
                Container(
                  height: 55,
                  width: 70,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xff00BCD4),
                      )),
                  child: Center(child: Image.asset('assets/images/google.png')),
                ),
                Container(
                  height: 55,
                  width: 70,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xff00BCD4),
                      )),
                  child: Center(
                      child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
