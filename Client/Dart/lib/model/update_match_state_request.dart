//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class UpdateMatchStateRequest {
  /// Returns a new [UpdateMatchStateRequest] instance.
  UpdateMatchStateRequest({
    required this.highlight,
  });

  bool highlight;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateMatchStateRequest && other.highlight == highlight;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (highlight.hashCode);

  @override
  String toString() => 'UpdateMatchStateRequest[highlight=$highlight]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'highlight'] = highlight;
    return _json;
  }

  /// Returns a new [UpdateMatchStateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateMatchStateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UpdateMatchStateRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UpdateMatchStateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateMatchStateRequest(
        highlight: mapValueOfType<bool>(json, r'highlight')!,
      );
    }
    return null;
  }

  static List<UpdateMatchStateRequest>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UpdateMatchStateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateMatchStateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateMatchStateRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateMatchStateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateMatchStateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateMatchStateRequest-objects as value to a dart map
  static Map<String, List<UpdateMatchStateRequest>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UpdateMatchStateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateMatchStateRequest.listFromJson(
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
    'highlight',
  };
}
