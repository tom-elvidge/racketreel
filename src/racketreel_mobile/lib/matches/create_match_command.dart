import 'package:json_annotation/json_annotation.dart';
import 'set_type.dart';
part 'create_match_command.g.dart';

@JsonSerializable()
class CreateMatchCommand {
  List<String> players;
  String servingFirst;
  int sets;
  SetType setType;
  SetType finalSetType;

  CreateMatchCommand(
    this.players,
    this.servingFirst,
    this.sets,
    this.setType,
    this.finalSetType,
  );

  factory CreateMatchCommand.fromJson(Map<String, dynamic> json) =>
      _$CreateMatchCommandToJson(json);

  Map<String, dynamic> toJson() => _$CreateMatchCommandToJson(this);
}
