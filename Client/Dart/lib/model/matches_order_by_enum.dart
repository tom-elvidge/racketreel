//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;


class MatchesOrderByEnum {
  /// Instantiate a new enum with the provided [value].
  const MatchesOrderByEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const createdAt = MatchesOrderByEnum._(r'CreatedAt');
  static const completedAt = MatchesOrderByEnum._(r'CompletedAt');

  /// List of all possible values in this [enum][MatchesOrderByEnum].
  static const values = <MatchesOrderByEnum>[
    createdAt,
    completedAt,
  ];

  static MatchesOrderByEnum? fromJson(dynamic value) => MatchesOrderByEnumTypeTransformer().decode(value);

  static List<MatchesOrderByEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MatchesOrderByEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MatchesOrderByEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MatchesOrderByEnum] to String,
/// and [decode] dynamic data back to [MatchesOrderByEnum].
class MatchesOrderByEnumTypeTransformer {
  factory MatchesOrderByEnumTypeTransformer() => _instance ??= const MatchesOrderByEnumTypeTransformer._();

  const MatchesOrderByEnumTypeTransformer._();

  String encode(MatchesOrderByEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a MatchesOrderByEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MatchesOrderByEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'CreatedAt': return MatchesOrderByEnum.createdAt;
        case r'CompletedAt': return MatchesOrderByEnum.completedAt;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [MatchesOrderByEnumTypeTransformer] instance.
  static MatchesOrderByEnumTypeTransformer? _instance;
}

