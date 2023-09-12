import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleImage extends StatelessWidget {
   CircleImage({super.key , required this.radius});
   
   var radius ;
   var _image = null ;

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
          radius: radius,
          backgroundColor:
              Theme.of(context).colorScheme.background.withOpacity(0.8),
          child: _image != null
              ? ClipOval(
                  child: Image.file(
                    _image!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(
                  Icons.person,
                  size: radius * 5,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
        );
  }
}