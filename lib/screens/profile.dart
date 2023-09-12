import 'package:flutter/material.dart';
import 'package:video_player_app/widgets/circle_image_url.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hritik Roshan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 22,
        ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Add navigation to settings or options here
            },
          ),
        ],
      ),
      body: Stack(
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
             SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
               
                children: [
                  CircleImageUrl(
                imageUrl:
                    'https://th.bing.com/th/id/OIP.868vh_SDCQdcqSIRRKaUgAHaEK?w=317&h=180&c=7&r=0&o=5&pid=1.7',radius: 40.0),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      SizedBox(height: 4),
                      Text(
                        '123 Posts',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '1.2M Followers',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(width:50),
                 const Icon(Icons.verified,color: Colors.blue,size: 40,)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'User Bio', // User's bio
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 40, // Height of the "Edit Profile" button
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality to edit the profile
                },
                child: const Text('Edit Profile'),
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns in the grid
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 12, // Number of posts
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Image.network(
                   'https://th.bing.com/th/id/OIP.868vh_SDCQdcqSIRRKaUgAHaEK?w=317&h=180&c=7&r=0&o=5&pid=1.7', // Post image
                  fit: BoxFit.cover,
                );
              },
            ),
          ],
        ),
      ),
      ]),
    );
  }
}
