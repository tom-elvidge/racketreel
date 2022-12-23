//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class ParticipantSetSummary {
  /// Returns a new [ParticipantSetSummary] instance.
  ParticipantSetSummary({
    required this.games,
    this.tiebreakPoints,
  });

  /// The number of games won by the player in this set.
  int games;

  /// The number of points won in the set tiebreak. Only used when the set goes to a tiebreak.
  int? tiebreakPoints;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParticipantSetSummary &&
     other.games == games &&
     other.tiebreakPoints == tiebreakPoints;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (games.hashCode) +
    (tiebreakPoints == null ? 0 : tiebreakPoints!.hashCode);

  @override
  String toString() => 'ParticipantSetSummary[games=$games, tiebreakPoints=$tiebreakPoints]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'games'] = games;
    if (tiebreakPoints != null) {
      _json[r'tiebreakPoints'] = tiebreakPoints;
    } else {
      _json[r'tiebreakPoints'] = null;
    }
    return _json;
  }

  /// Returns a new [ParticipantSetSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ParticipantSetSummary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ParticipantSetSummary[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ParticipantSetSummary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ParticipantSetSummary(
        games: mapValueOfType<int>(json, r'games')!,
        tiebreakPoints: mapValueOfType<int>(json, r'tiebreakPoints'),
      );
    }
    return null;
  }

  static List<ParticipantSetSummary>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParticipantSetSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParticipantSetSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ParticipantSetSummary> mapFromJson(dynamic json) {
    final map = <String, ParticipantSetSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParticipantSetSummary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ParticipantSetSummary-objects as value to a dart map
  static Map<String, List<ParticipantSetSummary>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ParticipantSetSummary>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParticipantSetSummary.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'games',
  };
}

