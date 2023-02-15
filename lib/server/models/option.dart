import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_server/server/models/typedef.dart';
import 'package:uuid/uuid.dart';

part 'gen/option.g.dart';

@JsonSerializable()
class Option extends Equatable {
  /// {macro Option}
  Option({
    String? id,
    required this.dishOptionId,
    required this.name,
    this.additionalCharge,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  @JsonKey(name: 'dish_option_id')
  final String dishOptionId;

  final String name;

  @JsonKey(name: 'additional_charge')
  final double? additionalCharge;

  /// Deserializes the given [JsonMap] into a [Option].
  static Option fromJson(JsonMap json) {
    return _$OptionFromJson(json);
  }

  /// Converts this [Option] into a [JsonMap].
  JsonMap toJson() => _$OptionToJson(this);

  /// Returns a copy of [Option] with given parameters
  Option copyWith({
    String? id,
    String? dishOptionId,
    String? name,
    double? additionalCharge,
  }) {
    return Option(
      id: id ?? this.id,
      dishOptionId: dishOptionId ?? this.dishOptionId,
      name: name ?? this.name,
      additionalCharge: additionalCharge ?? this.additionalCharge,
    );
  }

  @override
  List<Object?> get props => [id, dishOptionId, name, additionalCharge];
}
