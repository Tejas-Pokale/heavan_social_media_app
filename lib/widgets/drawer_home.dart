import 'package:flutter/material.dart';
import 'package:video_player_app/widgets/circle_image_url.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      child: 
        Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                  Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
            ),
            ListView(
        
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text("John Doe"),
            accountEmail: const Text("johndoe@example.com"),
            currentAccountPicture: CircleImageUrl(
                imageUrl:
                    'https://th.bing.com/th/id/OIP.868vh_SDCQdcqSIRRKaUgAHaEK?w=317&h=180&c=7&r=0&o=5&pid=1.7',radius: 50.0),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.0),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Navigate to the home screen or perform relevant action.
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Friends'),
            onTap: () {
              // Navigate to the friends screen or perform relevant action.
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Messages'),
            onTap: () {
              // Navigate to the messages screen or perform relevant action.
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_rounded),
            title: const Text('Verify account'),
            onTap: () {
              // Navigate to the notifications screen or perform relevant action.
            },
          ),
          
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to the settings screen or perform relevant action.
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              // Perform logout action.
            },
          ),
        ],
      ),
          ]
        ),
    );
  }
}
