import 'package:flutter/material.dart';
import 'package:video_player_app/models/Human.dart';

class GenderPicker extends StatefulWidget {
  GenderPicker({super.key});

  final genders = [
    Human(color: Colors.red, icon: Icons.male, title: 'male'),
    Human(color: const Color.fromARGB(255, 241, 7, 222), icon: Icons.female, title: 'female'),
    Human(color: const Color.fromARGB(255, 48, 2, 248), icon: Icons.transgender, title: 'others'),
  ];

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  String? selectedGender; // Add this variable to store the selected gender

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Select gender : ',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        // const SizedBox(
        //   width: 15,
        // ),
        Expanded(
          flex: 1,
          child: DropdownButton(
            dropdownColor: Colors.black,
            value: selectedGender, // Assign the selected gender here
            items: widget.genders.map((gen) {
              return DropdownMenuItem(
                value: gen.title, // Assign the value as the selected Human object
                child: SizedBox(
                  width: 130,
                  child: ElevatedButton.icon(
                    onPressed: null,
                    icon: Icon(
                      gen.icon,
                      color: gen.color,
                    ),
                    label: Text(
                      gen.title,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedGender = value!; // Update the selected gender
              });
            },
          ),
        )
      ],
    );
  }
}
