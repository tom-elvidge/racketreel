import 'package:json_annotation/json_annotation.dart';

enum SetType {
  @JsonValue("SixAllAdvantageRule")
  sixAllAdvantageRule,
  @JsonValue("SixAllTwelvePointTiebreaker")
  sixAllTwelvePointTiebreaker,
  @JsonValue("WimbledonFinalSet")
  wimbledonFinalSet,
  @JsonValue("SuperTiebreaker")
  superTiebreaker,
}
