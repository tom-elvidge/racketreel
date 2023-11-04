import 'package:flutter/material.dart';
import 'package:racketreel/shared/domain/match_format.dart';

class FormatField extends StatelessWidget {
  final void Function(MatchFormat? f) onChange;

  const FormatField({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<MatchFormat>(
      decoration: const InputDecoration(
        icon: Icon(Icons.rule),
        labelText: "Format",
      ),
      items: MatchFormat.values
          .map((MatchFormat f) => DropdownMenuItem<MatchFormat>(
        value: f,
        child: Text(FormatHelpers.friendlyName(f)),
      ))
          .toList(),
      onChanged: onChange,
    );
  }
}

class FormatHelpers {
  static final _setTypeFriendlyNameMap = {
    MatchFormat.None: 'None',
  };

  static String friendlyName(MatchFormat format) {
    var setTypeString = _setTypeFriendlyNameMap[format];
    if (setTypeString == null) {
      throw Exception('No friendly name for ${format.toString()}');
    }
    return setTypeString;
  }
}
