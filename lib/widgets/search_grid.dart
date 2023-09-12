import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchGrid extends StatelessWidget {
  const SearchGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns in the grid
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 24, // Number of posts
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Image.network(
          'https://th.bing.com/th/id/OIP.868vh_SDCQdcqSIRRKaUgAHaEK?w=317&h=180&c=7&r=0&o=5&pid=1.7', // Post image
          fit: BoxFit.cover,
        );
      },
    );
  }
}
