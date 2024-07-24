import 'dart:math';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final String label;
  final void Function(String s) onChange;

  // example names to use as a hint
  static final List<String> _examples = [
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
    'Jannik Sinner',
    'Alexander Zverev',
    'Alex de Minaur',
    'Grigor Dimitrov',
    'Andy Murray',
    'Roger Federer',
    'Tommy Paul',
    'Ben Shelton',
    'Ugo Humbert',
    'Holger Rune',
    'Lorenzo Musetti',
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
    'Elena Rybakina',
    'Jasmine Paolini',
    'Qinwen Zheng',
    'Jessica Pegula',
    'Daniel Collins',
    'Serena Williams',
    'Venus Williams',
    'Ash Barty',
    'Barbora Krejcikova',
    'Jelena Ostapenko',
    'Daria Kasatkina',
    'Emma Raducanu',
    'Marta Kostyuk',
    'Victoria Azarenka',
    'Leylah Fernandez',
    'Caroline Garcia'
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
