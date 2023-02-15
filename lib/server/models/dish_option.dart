import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_server/server/models/typedef.dart';
import 'package:uuid/uuid.dart';

part 'gen/dish_option.g.dart';

enum OptionType {
  onlyChoice,
  multiChoice,
}

@JsonSerializable()
class DishOption extends Equatable {
  /// {macro DishOption}
  DishOption({
    String? id,
    required this.dishId,
    required this.name,
    required this.type,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  @JsonKey(name: 'dish_id')
  final String dishId;

  final String name;

  final OptionType type;

  /// Deserializes the given [JsonMap] into a [DishOption].
  static DishOption fromJson(JsonMap json) {
    return _$DishOptionFromJson(json);
  }

  /// Converts this [DishOption] into a [JsonMap].
  JsonMap toJson() => _$DishOptionToJson(this);

  /// Returns a copy of [DishOption] with given parameters
  DishOption copyWith({
    String? id,
    String? dishId,
    String? name,
    OptionType? type,
  }) {
    return DishOption(
      id: id ?? this.id,
      dishId: dishId ?? this.dishId,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [id, dishId, name, type];
}
