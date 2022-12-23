//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class CreateMatchRequestBody {
  /// Returns a new [CreateMatchRequestBody] instance.
  CreateMatchRequestBody({
    this.participants = const [],
    this.servingFirst,
    this.format,
  });

  /// The list of participants of this match.
  List<String>? participants;

  /// The player who is serving first.
  String? servingFirst;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  MatchFormatEnum? format;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateMatchRequestBody &&
     other.participants == participants &&
     other.servingFirst == servingFirst &&
     other.format == format;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (participants == null ? 0 : participants!.hashCode) +
    (servingFirst == null ? 0 : servingFirst!.hashCode) +
    (format == null ? 0 : format!.hashCode);

  @override
  String toString() => 'CreateMatchRequestBody[participants=$participants, servingFirst=$servingFirst, format=$format]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (participants != null) {
      _json[r'participants'] = participants;
    } else {
      _json[r'participants'] = null;
    }
    if (servingFirst != null) {
      _json[r'servingFirst'] = servingFirst;
    } else {
      _json[r'servingFirst'] = null;
    }
    if (format != null) {
      _json[r'format'] = format;
    } else {
      _json[r'format'] = null;
    }
    return _json;
  }

  /// Returns a new [CreateMatchRequestBody] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateMatchRequestBody? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateMatchRequestBody[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateMatchRequestBody[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateMatchRequestBody(
        participants: json[r'participants'] is List
            ? (json[r'participants'] as List).cast<String>()
            : const [],
        servingFirst: mapValueOfType<String>(json, r'servingFirst'),
        format: MatchFormatEnum.fromJson(json[r'format']),
      );
    }
    return null;
  }

  static List<CreateMatchRequestBody>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateMatchRequestBody>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateMatchRequestBody.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateMatchRequestBody> mapFromJson(dynamic json) {
    final map = <String, CreateMatchRequestBody>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateMatchRequestBody.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateMatchRequestBody-objects as value to a dart map
  static Map<String, List<CreateMatchRequestBody>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateMatchRequestBody>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateMatchRequestBody.listFromJson(entry.value, growable: growable,);
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

