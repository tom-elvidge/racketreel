import 'package:flutter/material.dart';

class ServingFirstField extends StatelessWidget {
  final List<String> names;
  final void Function(String? s) onChange;

  const ServingFirstField({
    Key? key,
    required this.names,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        icon: Icon(Icons.looks_one_outlined),
        labelText: 'Serving first',
      ),
      items: _distinct(names)
          ? names
              .map((name) => DropdownMenuItem<String>(
                    // value must be unique, use random when names are not distinct
                    value: name,
                    child: Text(name),
                  ))
              .toList()
          : [],
      onChanged: onChange,
    );
  }

  static bool _distinct(List<String> x) {
    List<String> existing = [];
    for (var val in x) {
      if (existing.contains(val)) {
        return false;
      } else {
        existing.add(val);
      }
    }
    return true;
  }
}
