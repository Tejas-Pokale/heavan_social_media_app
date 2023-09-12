import 'package:flutter/material.dart';

class SearchChips extends StatefulWidget {
  const SearchChips({super.key});

  @override
  OptionsScreenState createState() => OptionsScreenState();
}

class OptionsScreenState extends State<SearchChips> {
  String selectedOption = 'Reccommended'; // Default selected option

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        children: [
          buildOptionChip('Reccommended'),
          buildOptionChip('New'),
          buildOptionChip('Trending'),
          buildOptionChip('Most Liked'),
        ],
      ),
    );
  }

  Widget buildOptionChip(String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(option,style:Theme.of(context).textTheme.titleSmall!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        )),
        selected: selectedOption == option,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(.2),
        selectedColor:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        onSelected: (isSelected) {
          setState(() {
            if (isSelected) {
              selectedOption = option;
            } else {
              selectedOption = 'Reccommended'; // Deselecting resets to "All"
            }
          });
        },
      ),
    );
  }
}
