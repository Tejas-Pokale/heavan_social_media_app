import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player_app/screens/profile.dart';
import 'package:video_player_app/screens/search.dart';
import 'package:video_player_app/widgets/animated_bottom.dart';
import 'package:video_player_app/widgets/circle_image_url.dart';
import 'package:video_player_app/widgets/demopage.dart';
import 'package:video_player_app/widgets/drawer_home.dart';
import 'package:video_player_app/widgets/home_badge.dart';
import 'package:video_player_app/widgets/remember_me.dart';
import 'package:video_player_app/widgets/speed_dial_home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player_app/providers/fab_visibility_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool dialogAcceptVal = false;
  bool isFabVisible = true;
  late AnimationController controller;
  var _currentIndex = 0;

  final Map<int, Widget> screenMap = {
    0: const HomeScreen(),
    1: const SearchScreen(),
    2: DemoPage(text: 'Likes'),
    3: const ProfileScreen(),
  };

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   Duration.zero,
    //   () {
    //     showWarningDialog();
    //   },
    // );

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        drawer: const DrawerHome(),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
           if(_currentIndex == 0){
             if (notification.direction == ScrollDirection.forward) {
              if (!isFabVisible) {
                // setState(() {
                //   isFabVisible = true;
                // });

                isFabVisible = true;
                print('shoving');
                ref.watch(fabVisibilityProvider.notifier).toggleFabVisibility(
                    vertical: isFabVisible, horizontal: false);
              }
            } else if (notification.direction == ScrollDirection.reverse) {
              if (isFabVisible) {
                // setState(() {
                //   isFabVisible = false;
                // });
                isFabVisible = false;
                print('hiding');
                ref.watch(fabVisibilityProvider.notifier).toggleFabVisibility(
                    vertical: isFabVisible, horizontal: false);
              }
            }
           }
           else if(_currentIndex == 1){
            if (notification.direction == ScrollDirection.forward) {
              
                // setState(() {
                //   isFabVisible = true;
                // });

                //isFabVisible = true;
                print('shoving x');
                ref.watch(fabVisibilityProvider.notifier).toggleFabVisibility(
                    vertical: true, horizontal: false);
              
            } else if (notification.direction == ScrollDirection.reverse) {
              
                // setState(() {
                //   isFabVisible = false;
                // });
                //isFabVisible = false;
                print('hiding y');
                ref.watch(fabVisibilityProvider.notifier).toggleFabVisibility(
                    vertical: true, horizontal: false);
              
            }
           }
            return true;
          },
          child: _currentIndex == 0
              ? NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        floating: true,
                        snap: false,
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: CircleImageUrl(
                              imageUrl:
                                  'https://th.bing.com/th/id/OIP.868vh_SDCQdcqSIRRKaUgAHaEK?w=317&h=180&c=7&r=0&o=5&pid=1.7',
                              radius: 3.0,
                            ),
                          ),
                        ),
                        title: Text('Heavan',
                            style: GoogleFonts.poppins(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500)),
                        centerTitle: true,
                        actions: [
                          HomeBadge(),
                        ],
                      ),
                    ];
                  },
                  body: Stack(
                    children: [
                      Container(
                        width: size.width,
                        height: size.height,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.1),
                            Colors.black,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                      ),
                      ListView.builder(
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Item $index"),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : screenMap[_currentIndex]!,
        ),
        bottomNavigationBar: AnimatedBottomBar(
          isVisible: ref
              .watch(fabVisibilityProvider) 
              ,
          chnageScreen: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        floatingActionButton: ref
              .watch(fabVisibilityProvider)
              
            ? const SpeedDialHome()
            : null,
      ),
    );
  }

  void showWarningDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            'Warnings',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onErrorContainer),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'This app contains adult contents and self harm videos and images which can be disturbing for you!!!',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 20),
              Text(
                'By using this app, you agree to our:',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Open Terms and Conditions page (replace with your route)
                  Navigator.of(context).pop(); // Close the dialog
                  // Navigate to the terms and conditions page
                  // Example: Navigator.of(context).pushNamed('/terms');
                },
                child: const Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Open Privacy Policy page (replace with your route)
                  Navigator.of(context).pop(); // Close the dialog
                  // Navigate to the privacy policy page
                  // Example: Navigator.of(context).pushNamed('/privacy');
                },
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RememberMeWidget(
                remember: false,
                label:
                    'I agree to all the terms and declare that I\'m 18+ adult',
                updateState: (val) {
                  dialogAcceptVal = val;
                },
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('enter the app'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
