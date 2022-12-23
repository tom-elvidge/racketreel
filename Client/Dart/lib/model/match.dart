//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class Match {
  /// Returns a new [Match] instance.
  Match({
    required this.id,
    required this.createdAt,
    this.completedAt,
    this.participants = const [],
    required this.servingFirst,
    required this.format,
    this.states = const [],
    this.summary,
  });

  /// A unique identifier for this match.
  int id;

  /// The date and time at which this match was created. String formatted as an ISO 8601 date and time in UTC.
  String createdAt;

  /// The date and time at which this match was completed. String formatted as an ISO 8601 date and time in UTC. Only included if the match has been completed.
  String? completedAt;

  /// The list of participants in this match.
  List<String> participants;

  /// The participant who is serving first.
  String servingFirst;

  MatchFormatEnum format;

  /// The list of all the states in the match ordered by the created date and time.
  List<State>? states;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  MatchSummary? summary;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Match &&
     other.id == id &&
     other.createdAt == createdAt &&
     other.completedAt == completedAt &&
     other.participants == participants &&
     other.servingFirst == servingFirst &&
     other.format == format &&
     other.states == states &&
     other.summary == summary;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (createdAt.hashCode) +
    (completedAt == null ? 0 : completedAt!.hashCode) +
    (participants.hashCode) +
    (servingFirst.hashCode) +
    (format.hashCode) +
    (states == null ? 0 : states!.hashCode) +
    (summary == null ? 0 : summary!.hashCode);

  @override
  String toString() => 'Match[id=$id, createdAt=$createdAt, completedAt=$completedAt, participants=$participants, servingFirst=$servingFirst, format=$format, states=$states, summary=$summary]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'id'] = id;
      _json[r'createdAt'] = createdAt;
    if (completedAt != null) {
      _json[r'completedAt'] = completedAt;
    } else {
      _json[r'completedAt'] = null;
    }
      _json[r'participants'] = participants;
      _json[r'servingFirst'] = servingFirst;
      _json[r'format'] = format;
    if (states != null) {
      _json[r'states'] = states;
    } else {
      _json[r'states'] = null;
    }
    if (summary != null) {
      _json[r'summary'] = summary;
    } else {
      _json[r'summary'] = null;
    }
    return _json;
  }

  /// Returns a new [Match] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Match? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Match[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Match[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Match(
        id: mapValueOfType<int>(json, r'id')!,
        createdAt: mapValueOfType<String>(json, r'createdAt')!,
        completedAt: mapValueOfType<String>(json, r'completedAt'),
        participants: json[r'participants'] is List
            ? (json[r'participants'] as List).cast<String>()
            : const [],
        servingFirst: mapValueOfType<String>(json, r'servingFirst')!,
        format: MatchFormatEnum.fromJson(json[r'format'])!,
        states: State.listFromJson(json[r'states']) ?? const [],
        summary: MatchSummary.fromJson(json[r'summary']),
      );
    }
    return null;
  }

  static List<Match>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Match>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Match.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Match> mapFromJson(dynamic json) {
    final map = <String, Match>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Match.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Match-objects as value to a dart map
  static Map<String, List<Match>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Match>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Match.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'createdAt',
    'participants',
    'servingFirst',
    'format',
  };
}

