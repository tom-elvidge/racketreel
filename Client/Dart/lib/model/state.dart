//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class State {
  /// Returns a new [State] instance.
  State({
    required this.createdAt,
    required this.serving,
    this.score = const {},
    required this.tiebreak,
    required this.highlight,
  });

  /// The date and time at which this state was created. String formatted as an ISO 8601 date and time in UTC.
  String createdAt;

  /// The participant who is serving.
  String serving;

  /// A mapping from the name of each participant as a string to their score.
  Map<String, ParticipantScore> score;

  /// A flag to mark the time from the previous state until this state as in a tiebreak.
  bool tiebreak;

  /// A flag to mark the time from the previous state until this state as a highlight.
  bool highlight;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is State &&
          other.createdAt == createdAt &&
          other.serving == serving &&
          other.score == score &&
          other.tiebreak == tiebreak &&
          other.highlight == highlight;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (createdAt.hashCode) +
      (serving.hashCode) +
      (score.hashCode) +
      (tiebreak.hashCode) +
      (highlight.hashCode);

  @override
  String toString() =>
      'State[createdAt=$createdAt, serving=$serving, score=$score, tiebreak=$tiebreak, highlight=$highlight]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'createdAt'] = createdAt;
    _json[r'serving'] = serving;
    _json[r'score'] = score;
    _json[r'tiebreak'] = tiebreak;
    _json[r'highlight'] = highlight;
    return _json;
  }

  /// Returns a new [State] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static State? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "State[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "State[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return State(
        createdAt: mapValueOfType<String>(json, r'createdAt')!,
        serving: mapValueOfType<String>(json, r'serving')!,
        score: ParticipantScore.mapFromJson(json[r'score']!),
        tiebreak: mapValueOfType<bool>(json, r'tiebreak')!,
        highlight: mapValueOfType<bool>(json, r'highlight')!,
      );
    }
    return null;
  }

  static List<State>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <State>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = State.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, State> mapFromJson(dynamic json) {
    final map = <String, State>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = State.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of State-objects as value to a dart map
  static Map<String, List<State>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<State>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = State.listFromJson(
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
    'createdAt',
    'serving',
    'score',
    'tiebreak',
    'highlight',
  };
}
