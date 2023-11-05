import 'dart:math';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final String label;
  final void Function(String s) onChange;

  // example names to use as a hint
  static final List<String> _examples = [
    // top 10 atp as of 02/12/2022
    'Carlos Alcaraz',
    'Rafael Nadal',
    'Casper Ruud',
    'Stefanos Tsitsipas',
    'Novak Djokovic',
    'Felix Auger-Aliassime',
    'Daniil Medvedev',
    'Andrey Rublev',
    'Taylor Fritz',
    'Hubert Hurkacz',
    // top 10 wta as of 02/12/2022
    'Iga Swiatek',
    'Ons Jabeur',
    'Jessica Pegula',
    'Caroline Garcia',
    'Aryna Sabalenka',
    'Maria Sakkari',
    'Coco Gauff',
    'Daria Kasatkina',
    'Veronika Kudermetova',
    'Simona Halep',
  ];

  const NameField({
    Key? key,
    required this.label,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: const Icon(Icons.person),
        hintText: _examples[Random().nextInt(_examples.length)],
        labelText: label,
      ),
      validator: _validate,
      onChanged: onChange,
    );
  }

  String? _validate(String? value) {
    // return null if name is valid and a message explaining why if not
    if (value == null || value.isEmpty) {
      return 'The name cannot be empty';
    }
    if (value.length < 2) {
      return 'The name must have at least two characters';
    }
    return null;
  }
}
