//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class MatchSummary {
  /// Returns a new [MatchSummary] instance.
  MatchSummary({
    required this.completedAt,
    required this.winner,
    this.sets = const {},
  });

  /// The date and time at which this match was completed. String formatted as an ISO 8601 date and time in UTC.
  String completedAt;

  /// The name of the player which won the set.
  String winner;

  /// The summary of the score for each set. Represented as a mapping from the set index (0, 1, 2, etc) to the summary of that set.
  Map<String, SetSummary> sets;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchSummary &&
          other.completedAt == completedAt &&
          other.winner == winner &&
          other.sets == sets;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (completedAt.hashCode) + (winner.hashCode) + (sets.hashCode);

  @override
  String toString() =>
      'MatchSummary[completedAt=$completedAt, winner=$winner, sets=$sets]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'completedAt'] = completedAt;
    _json[r'winner'] = winner;
    _json[r'sets'] = sets;
    return _json;
  }

  /// Returns a new [MatchSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MatchSummary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MatchSummary[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MatchSummary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MatchSummary(
        completedAt: mapValueOfType<String>(json, r'completedAt')!,
        winner: mapValueOfType<String>(json, r'winner')!,
        sets: SetSummary.mapFromJson(json[r'sets']!),
      );
    }
    return null;
  }

  static List<MatchSummary>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MatchSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MatchSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MatchSummary> mapFromJson(dynamic json) {
    final map = <String, MatchSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MatchSummary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MatchSummary-objects as value to a dart map
  static Map<String, List<MatchSummary>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MatchSummary>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MatchSummary.listFromJson(
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
    'sets',
  };
}
