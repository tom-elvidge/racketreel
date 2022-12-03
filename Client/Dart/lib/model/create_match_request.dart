//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class CreateMatchRequest {
  /// Returns a new [CreateMatchRequest] instance.
  CreateMatchRequest({
    this.players = const [],
    this.servingFirst,
    required this.sets,
    required this.setType,
    required this.finalSetType,
  });

  List<String> players;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? servingFirst;

  int sets;

  String setType;

  String finalSetType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateMatchRequest &&
     other.players == players &&
     other.servingFirst == servingFirst &&
     other.sets == sets &&
     other.setType == setType &&
     other.finalSetType == finalSetType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (players.hashCode) +
    (servingFirst == null ? 0 : servingFirst!.hashCode) +
    (sets.hashCode) +
    (setType.hashCode) +
    (finalSetType.hashCode);

  @override
  String toString() => 'CreateMatchRequest[players=$players, servingFirst=$servingFirst, sets=$sets, setType=$setType, finalSetType=$finalSetType]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'players'] = players;
    if (servingFirst != null) {
      _json[r'servingFirst'] = servingFirst;
    } else {
      _json[r'servingFirst'] = null;
    }
      _json[r'sets'] = sets;
      _json[r'setType'] = setType;
      _json[r'finalSetType'] = finalSetType;
    return _json;
  }

  /// Returns a new [CreateMatchRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateMatchRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateMatchRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateMatchRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateMatchRequest(
        players: json[r'players'] is List
            ? (json[r'players'] as List).cast<String>()
            : const [],
        servingFirst: mapValueOfType<String>(json, r'servingFirst'),
        sets: mapValueOfType<int>(json, r'sets')!,
        setType: mapValueOfType<String>(json, r'setType')!,
        finalSetType: mapValueOfType<String>(json, r'finalSetType')!,
      );
    }
    return null;
  }

  static List<CreateMatchRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateMatchRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateMatchRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateMatchRequest> mapFromJson(dynamic json) {
    final map = <String, CreateMatchRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateMatchRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateMatchRequest-objects as value to a dart map
  static Map<String, List<CreateMatchRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateMatchRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateMatchRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'players',
    'sets',
    'setType',
    'finalSetType',
  };
}

