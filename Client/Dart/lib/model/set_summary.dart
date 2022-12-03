//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class SetSummary {
  /// Returns a new [SetSummary] instance.
  SetSummary({
    required this.completedDateTime,
    required this.winner,
    required this.tieBreak,
    this.score = const {},
  });

  String completedDateTime;

  String winner;

  bool tieBreak;

  Map<String, PlayerSetScore> score;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SetSummary &&
          other.completedDateTime == completedDateTime &&
          other.winner == winner &&
          other.tieBreak == tieBreak &&
          other.score == score;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (completedDateTime.hashCode) +
      (winner.hashCode) +
      (tieBreak.hashCode) +
      (score.hashCode);

  @override
  String toString() =>
      'SetSummary[completedDateTime=$completedDateTime, winner=$winner, tieBreak=$tieBreak, score=$score]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'completedDateTime'] = completedDateTime;
    _json[r'winner'] = winner;
    _json[r'tieBreak'] = tieBreak;
    _json[r'score'] = score;
    return _json;
  }

  /// Returns a new [SetSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SetSummary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "SetSummary[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "SetSummary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SetSummary(
        completedDateTime: mapValueOfType<String>(json, r'completedDateTime')!,
        winner: mapValueOfType<String>(json, r'winner')!,
        tieBreak: mapValueOfType<bool>(json, r'tieBreak')!,
        score: PlayerSetScore.mapFromJson(json[r'score']) ?? const {},
      );
    }
    return null;
  }

  static List<SetSummary>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <SetSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SetSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SetSummary> mapFromJson(dynamic json) {
    final map = <String, SetSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SetSummary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SetSummary-objects as value to a dart map
  static Map<String, List<SetSummary>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<SetSummary>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SetSummary.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'completedDateTime',
    'winner',
    'tieBreak',
  };
}
