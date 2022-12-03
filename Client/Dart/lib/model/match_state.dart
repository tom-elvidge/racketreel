//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class MatchState {
  /// Returns a new [MatchState] instance.
  MatchState({
    required this.createdDateTime,
    required this.serving,
    this.score = const {},
    required this.isTieBreak,
    required this.highlight,
  });

  String createdDateTime;

  String serving;

  Map<String, PlayerScore> score;

  bool isTieBreak;

  bool highlight;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchState &&
          other.createdDateTime == createdDateTime &&
          other.serving == serving &&
          other.score == score &&
          other.isTieBreak == isTieBreak &&
          other.highlight == highlight;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (createdDateTime.hashCode) +
      (serving.hashCode) +
      (score.hashCode) +
      (isTieBreak.hashCode) +
      (highlight.hashCode);

  @override
  String toString() =>
      'MatchState[createdDateTime=$createdDateTime, serving=$serving, score=$score, isTieBreak=$isTieBreak, highlight=$highlight]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'createdDateTime'] = createdDateTime;
    _json[r'serving'] = serving;
    _json[r'score'] = score;
    _json[r'isTieBreak'] = isTieBreak;
    _json[r'highlight'] = highlight;
    return _json;
  }

  /// Returns a new [MatchState] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MatchState? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MatchState[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MatchState[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MatchState(
        createdDateTime: mapValueOfType<String>(json, r'createdDateTime')!,
        serving: mapValueOfType<String>(json, r'serving')!,
        score: PlayerScore.mapFromJson(json[r'score']!),
        isTieBreak: mapValueOfType<bool>(json, r'isTieBreak')!,
        highlight: mapValueOfType<bool>(json, r'highlight')!,
      );
    }
    return null;
  }

  static List<MatchState>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MatchState>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MatchState.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MatchState> mapFromJson(dynamic json) {
    final map = <String, MatchState>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MatchState.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MatchState-objects as value to a dart map
  static Map<String, List<MatchState>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MatchState>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MatchState.listFromJson(
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
    'createdDateTime',
    'serving',
    'score',
    'isTieBreak',
    'highlight',
  };
}
