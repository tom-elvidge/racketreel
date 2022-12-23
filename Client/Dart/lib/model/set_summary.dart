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
    required this.completedAt,
    required this.winner,
    required this.tiebreak,
    this.score = const {},
  });

  /// The date and time at which this set was completed. String formatted as an ISO 8601 date and time in UTC.
  String completedAt;

  /// The name of the player which won the set.
  String winner;

  /// A boolean flag to indicate this set went to a tiebreak.
  bool tiebreak;

  /// The summary of the score of the set for each player. Represented as a mapping from the name of each player to the summary for that player.
  Map<String, ParticipantSetSummary> score;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SetSummary &&
          other.completedAt == completedAt &&
          other.winner == winner &&
          other.tiebreak == tiebreak &&
          other.score == score;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (completedAt.hashCode) +
      (winner.hashCode) +
      (tiebreak.hashCode) +
      (score.hashCode);

  @override
  String toString() =>
      'SetSummary[completedAt=$completedAt, winner=$winner, tiebreak=$tiebreak, score=$score]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'completedAt'] = completedAt;
    _json[r'winner'] = winner;
    _json[r'tiebreak'] = tiebreak;
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
        completedAt: mapValueOfType<String>(json, r'completedAt')!,
        winner: mapValueOfType<String>(json, r'winner')!,
        tiebreak: mapValueOfType<bool>(json, r'tiebreak')!,
        score: ParticipantSetSummary.mapFromJson(json[r'score']!),
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
    'completedAt',
    'winner',
    'tiebreak',
    'score',
  };
}
