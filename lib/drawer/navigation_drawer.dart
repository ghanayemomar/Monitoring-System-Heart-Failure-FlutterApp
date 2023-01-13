import 'package:flutter/material.dart';
import 'package:oma/Screens/HomePageScreen.dart';
import 'package:oma/Screens/MedicalHistoryScreen.dart';
import 'package:oma/Screens/MedicalProfileScreen.dart';
import 'package:oma/Screens/TermsAndServicesScreen.dart';
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
          decoration: const BoxDecoration(
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
                  height: 20,
                ),
                const Divider(
                  thickness: 3,
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
                DrawerItem(
                    name: 'Medical Profile',
                    icon: Icons.medical_information,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, MedicalProfileScreen.screenRoute);
                    }),
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: 3,
                  height: 10,
                  color: mPrimaryTextColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Terms And Services',
                    icon: Icons.info,
                    onPressed: () => {
                          Navigator.pushNamed(
                              context, TermsAndServices.screenRoute)
                        }),
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
    return Column(
      children: [
        Container(width: 150, child: Image.asset('images/8376466.png')),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Welcome",
          style: TextStyle(
              fontSize: 20,
              color: mPrimaryTextColor,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "omarghanayem@gmail.com",
          style: TextStyle(
              fontSize: 20,
              color: mPrimaryTextColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
