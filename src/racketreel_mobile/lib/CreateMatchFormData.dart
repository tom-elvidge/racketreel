import 'package:json_annotation/json_annotation.dart';
import 'SetType.dart';
part 'CreateMatchFormData.g.dart';

@JsonSerializable()
class CreateMatchFormData {
  List<String> players;
  String servingFirst;
  int sets;
  SetType setType;
  SetType finalSetType;

  // rename to be consistent with api
  CreateMatchFormData(
    this.players,
    this.servingFirst,
    this.sets,
    this.setType,
    this.finalSetType,
  );

  factory CreateMatchFormData.fromJson(Map<String, dynamic> json) =>
      _$CreateMatchFormDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMatchFormDataToJson(this);
}
