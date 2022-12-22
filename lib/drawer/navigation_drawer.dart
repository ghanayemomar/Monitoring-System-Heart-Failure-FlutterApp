import 'package:flutter/material.dart';

import 'drawer_item.dart';
import 'people.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 28,
              ),
              const Divider(
                thickness: 2,
                height: 10,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Profile',
                  icon: Icons.person,
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile');
                  }),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Emergency',
                  icon: Icons.emergency_share,
                  onPressed: () => onItemPressed(context, index: 3)),
              const SizedBox(
                height: 25,
              ),
              const Divider(
                thickness: 2,
                height: 10,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Location',
                  icon: Icons.location_on,
                  onPressed: () => onItemPressed(context, index: 4)),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'LogOut',
                  icon: Icons.logout,
                  onPressed: () {
                    Navigator.pushNamed(context, 'out');
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const People()));
        break;
    }
  }

  Widget headerWidget() {
    const url =
        'https://mpng.subpng.com/20180406/bte/kisspng-medicine-staff-of-hermes-symbol-clip-art-hermes-5ac75ec4ee7465.7782658815230153649767.jpg';
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Safe Health Care',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text('Welcome To Our Application ..',
                style: TextStyle(fontSize: 14, color: Colors.black38))
          ],
        )
      ],
    );
  }
}
