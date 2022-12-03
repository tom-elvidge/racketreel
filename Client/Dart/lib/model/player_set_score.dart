//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class PlayerSetScore {
  /// Returns a new [PlayerSetScore] instance.
  PlayerSetScore({
    required this.games,
    required this.tieBreakPoints,
  });

  int games;

  int tieBreakPoints;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerSetScore &&
          other.games == games &&
          other.tieBreakPoints == tieBreakPoints;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (games.hashCode) + (tieBreakPoints.hashCode);

  @override
  String toString() =>
      'PlayerSetScore[games=$games, tieBreakPoints=$tieBreakPoints]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'games'] = games;
    _json[r'tieBreakPoints'] = tieBreakPoints;
    return _json;
  }

  /// Returns a new [PlayerSetScore] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PlayerSetScore? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PlayerSetScore[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PlayerSetScore[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PlayerSetScore(
        games: mapValueOfType<int>(json, r'games')!,
        tieBreakPoints: mapValueOfType<int>(json, r'tieBreakPoints')!,
      );
    }
    return null;
  }

  static List<PlayerSetScore>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PlayerSetScore>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PlayerSetScore.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PlayerSetScore> mapFromJson(dynamic json) {
    final map = <String, PlayerSetScore>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PlayerSetScore.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PlayerSetScore-objects as value to a dart map
  static Map<String, List<PlayerSetScore>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PlayerSetScore>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PlayerSetScore.listFromJson(
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
    'games',
    'tieBreakPoints',
  };
}
