//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class CreateStateRequestBody {
  /// Returns a new [CreateStateRequestBody] instance.
  CreateStateRequestBody({
    this.participant,
  });

  /// The participant who has scored a point.
  String? participant;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateStateRequestBody &&
     other.participant == participant;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (participant == null ? 0 : participant!.hashCode);

  @override
  String toString() => 'CreateStateRequestBody[participant=$participant]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (participant != null) {
      _json[r'participant'] = participant;
    } else {
      _json[r'participant'] = null;
    }
    return _json;
  }

  /// Returns a new [CreateStateRequestBody] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateStateRequestBody? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateStateRequestBody[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateStateRequestBody[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateStateRequestBody(
        participant: mapValueOfType<String>(json, r'participant'),
      );
    }
    return null;
  }

  static List<CreateStateRequestBody>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateStateRequestBody>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateStateRequestBody.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateStateRequestBody> mapFromJson(dynamic json) {
    final map = <String, CreateStateRequestBody>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateStateRequestBody.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateStateRequestBody-objects as value to a dart map
  static Map<String, List<CreateStateRequestBody>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateStateRequestBody>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateStateRequestBody.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

