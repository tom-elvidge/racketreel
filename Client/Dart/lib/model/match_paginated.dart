//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class MatchPaginated {
  /// Returns a new [MatchPaginated] instance.
  MatchPaginated({
    required this.pageSize,
    required this.pageNumber,
    required this.pageCount,
    this.data = const [],
  });

  /// Gets or Sets PageSize
  int pageSize;

  /// Gets or Sets PageNumber
  int pageNumber;

  /// Gets or Sets PageCount
  int pageCount;

  /// Gets or Sets Data
  List<Match> data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MatchPaginated &&
     other.pageSize == pageSize &&
     other.pageNumber == pageNumber &&
     other.pageCount == pageCount &&
     other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (pageSize.hashCode) +
    (pageNumber.hashCode) +
    (pageCount.hashCode) +
    (data.hashCode);

  @override
  String toString() => 'MatchPaginated[pageSize=$pageSize, pageNumber=$pageNumber, pageCount=$pageCount, data=$data]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
      _json[r'pageSize'] = pageSize;
      _json[r'pageNumber'] = pageNumber;
      _json[r'pageCount'] = pageCount;
      _json[r'data'] = data;
    return _json;
  }

  /// Returns a new [MatchPaginated] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MatchPaginated? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MatchPaginated[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MatchPaginated[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MatchPaginated(
        pageSize: mapValueOfType<int>(json, r'pageSize')!,
        pageNumber: mapValueOfType<int>(json, r'pageNumber')!,
        pageCount: mapValueOfType<int>(json, r'pageCount')!,
        data: Match.listFromJson(json[r'data'])!,
      );
    }
    return null;
  }

  static List<MatchPaginated>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MatchPaginated>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MatchPaginated.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MatchPaginated> mapFromJson(dynamic json) {
    final map = <String, MatchPaginated>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MatchPaginated.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MatchPaginated-objects as value to a dart map
  static Map<String, List<MatchPaginated>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MatchPaginated>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MatchPaginated.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'pageSize',
    'pageNumber',
    'pageCount',
    'data',
  };
}

