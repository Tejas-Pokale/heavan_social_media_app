import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// ignore: must_be_immutable
class AnimatedBottomBar extends StatefulWidget {
  AnimatedBottomBar(
      {super.key, required this.isVisible, required this.chnageScreen});

  bool isVisible;
  void Function(int index) chnageScreen;

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
  
    return Visibility(
      visible: widget.isVisible,
      maintainAnimation: true,
      maintainState: true,
      child: AnimatedScale(
        scale: widget.isVisible ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.bottomRight,
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _currentIndex = index;
            widget.chnageScreen(index);
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.cyanAccent,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor:const Color.fromARGB(255, 235, 86, 160),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.tealAccent,
            ),
          ],
        ),
      ),
    );
  }
}
