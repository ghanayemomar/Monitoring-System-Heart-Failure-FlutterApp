import 'package:flutter/material.dart';
import 'package:oma/Screens/HomePageScreen.dart';
import '../UserProfile/profile_page.dart';
import 'drawer_item.dart';
import '../Screens/LoginScreen.dart';
import '../Widget/MainWidget/constant.dart';

class NavigationDrawer extends StatelessWidget {
  static const screenRoute = 'NavigationDrawer';
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [mBackgroundColor, mSecondBackgroundColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
            child: Column(
              children: [
                headerWidget(),
                const SizedBox(
                  height: 80,
                ),
                const Divider(
                  thickness: 2,
                  height: 10,
                  color: mPrimaryTextColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Dashboard',
                    icon: Icons.dashboard,
                    onPressed: () {
                      Navigator.pushNamed(context, HomePageScreen.screenRoute);
                    }),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Profile',
                    icon: Icons.person,
                    onPressed: () {
                      Navigator.pushNamed(context, ProfilePage.screenRoute);
                    }),
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: 2,
                  height: 10,
                  color: mPrimaryTextColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Terms And Services',
                    icon: Icons.draw_rounded,
                    onPressed: () => {}),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Logout',
                    icon: Icons.logout,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: ((context) => LoginScreen()),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Row(
      children: [
        Container(padding: EdgeInsets.only(left: 80), child: Text("Hello"))
      ],
    );
  }
}
