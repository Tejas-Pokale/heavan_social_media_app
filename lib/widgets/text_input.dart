import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  const TextInputWidget({required this.controller,required this.hintText,required this.icon});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  bool suffixIcon = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        icon:  Icon(widget.icon),
        suffixIcon: widget.controller.text.isEmpty
            ? null
            : IconButton(
                onPressed: () {
                  widget.controller.text = '';
                },
                icon: const Icon(Icons.clear)),
      ),
      onChanged: (value) {
        setState(() {});
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email address';
        }
        return null;
      },
    );
  }
}
