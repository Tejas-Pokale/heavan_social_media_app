import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialHome extends StatelessWidget {
  const SpeedDialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      elevation: 8.0,
      animationCurve: Curves.elasticInOut,
      isOpenOnStart: false,
      backgroundColor: Colors.lightBlue ,
      children: [
        
        SpeedDialChild(
          
          labelWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Add video', style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),),
          ),
          backgroundColor: Color.fromARGB(255, 3, 83, 255),
          onTap: () {
            // Handle action 2
          },
          child: const Icon(Icons.video_collection_sharp),
        ),
        SpeedDialChild(
          labelWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Add post', style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),),
          ),
        
          backgroundColor: Colors.deepPurple,
          onTap: () {
            // Handle action 1
          },
          child: const Icon(Icons.image),
        ),
      ],
    );
  }
}
