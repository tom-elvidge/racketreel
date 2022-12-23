//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

/// The rule to use for tiebreaks.
class MatchFormatEnum {
  /// Instantiate a new enum with the provided [value].
  const MatchFormatEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const tiebreakToTen = MatchFormatEnum._(r'TiebreakToTen');
  static const bestOfThreeSevenPointTiebreaker = MatchFormatEnum._(r'BestOfThreeSevenPointTiebreaker');
  static const bestOfFiveSevenPointTiebreaker = MatchFormatEnum._(r'BestOfFiveSevenPointTiebreaker');
  static const fastFour = MatchFormatEnum._(r'FastFour');

  /// List of all possible values in this [enum][MatchFormatEnum].
  static const values = <MatchFormatEnum>[
    tiebreakToTen,
    bestOfThreeSevenPointTiebreaker,
    bestOfFiveSevenPointTiebreaker,
    fastFour,
  ];

  static MatchFormatEnum? fromJson(dynamic value) => MatchFormatEnumTypeTransformer().decode(value);

  static List<MatchFormatEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MatchFormatEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MatchFormatEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MatchFormatEnum] to String,
/// and [decode] dynamic data back to [MatchFormatEnum].
class MatchFormatEnumTypeTransformer {
  factory MatchFormatEnumTypeTransformer() => _instance ??= const MatchFormatEnumTypeTransformer._();

  const MatchFormatEnumTypeTransformer._();

  String encode(MatchFormatEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a MatchFormatEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MatchFormatEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'TiebreakToTen': return MatchFormatEnum.tiebreakToTen;
        case r'BestOfThreeSevenPointTiebreaker': return MatchFormatEnum.bestOfThreeSevenPointTiebreaker;
        case r'BestOfFiveSevenPointTiebreaker': return MatchFormatEnum.bestOfFiveSevenPointTiebreaker;
        case r'FastFour': return MatchFormatEnum.fastFour;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [MatchFormatEnumTypeTransformer] instance.
  static MatchFormatEnumTypeTransformer? _instance;
}

