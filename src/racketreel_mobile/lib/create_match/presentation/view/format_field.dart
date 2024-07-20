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
      isExpanded: true,
      items: MatchFormat.values
          .map((MatchFormat f) => DropdownMenuItem<MatchFormat>(
            value: f,
            child: Text(
              FormatHelpers.friendlyName(f),
              overflow: TextOverflow.ellipsis,
            ),
          )).toList(),
      onChanged: onChange,
    );
  }
}

class FormatHelpers {
  static final _setTypeFriendlyNameMap = {
    MatchFormat.bestOfOne: 'One set',
    MatchFormat.tiebreakToTen: 'Tiebreak to 10 points',
    MatchFormat.bestOfThree: 'Best of three sets',
    MatchFormat.bestOfThreeFinalSetTiebreak: "Best of three sets with a final set tiebreak",
    MatchFormat.bestOfFive: 'Best of five sets',
    MatchFormat.bestOfFiveFinalSetTiebreak: 'Best of five sets with a final set tiebreak',
    MatchFormat.fastFour: 'FAST4',
    MatchFormat.ltaCambridgeDoublesLeague: "LTA Cambridge doubles league (two sets)"
  };

  static String friendlyName(MatchFormat format) {
    var setTypeString = _setTypeFriendlyNameMap[format];
    if (setTypeString == null) {
      throw Exception('No friendly name for ${format.toString()}');
    }
    return setTypeString;
  }
}
