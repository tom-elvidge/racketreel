//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class UpdateStateRequestBody {
  /// Returns a new [UpdateStateRequestBody] instance.
  UpdateStateRequestBody({
    this.highlight,
  });

  /// A flag to mark the time from the previous state until this state as a highlight.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? highlight;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateStateRequestBody &&
     other.highlight == highlight;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (highlight == null ? 0 : highlight!.hashCode);

  @override
  String toString() => 'UpdateStateRequestBody[highlight=$highlight]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (highlight != null) {
      _json[r'highlight'] = highlight;
    } else {
      _json[r'highlight'] = null;
    }
    return _json;
  }

  /// Returns a new [UpdateStateRequestBody] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateStateRequestBody? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateStateRequestBody[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateStateRequestBody[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateStateRequestBody(
        highlight: mapValueOfType<bool>(json, r'highlight'),
      );
    }
    return null;
  }

  static List<UpdateStateRequestBody>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateStateRequestBody>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateStateRequestBody.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateStateRequestBody> mapFromJson(dynamic json) {
    final map = <String, UpdateStateRequestBody>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateStateRequestBody.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateStateRequestBody-objects as value to a dart map
  static Map<String, List<UpdateStateRequestBody>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateStateRequestBody>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateStateRequestBody.listFromJson(entry.value, growable: growable,);
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

