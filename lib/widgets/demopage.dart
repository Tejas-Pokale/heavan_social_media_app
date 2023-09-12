import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DemoPage extends StatelessWidget {
   DemoPage({super.key,required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Colors.blue,
      ),),
    );
  }
}
