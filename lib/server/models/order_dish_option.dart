import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_server/server/models/typedef.dart';
import 'package:uuid/uuid.dart';

part 'gen/order_dish_option.g.dart';

@JsonSerializable()
class OrderDishOption extends Equatable {
  /// {macro OrderDishOption}
  OrderDishOption({
    String? id,
    required this.dishOrderId,
    required this.optionId,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  @JsonKey(name: 'dish_order_id')
  final String dishOrderId;

  @JsonKey(name: 'option_id')
  final String optionId;

  /// Deserializes the given [JsonMap] into a [OrderDishOption].
  static OrderDishOption fromJson(JsonMap json) {
    return _$OrderDishOptionFromJson(json);
  }

  /// Converts this [OrderDishOption] into a [JsonMap].
  JsonMap toJson() => _$OrderDishOptionToJson(this);

  /// Returns a copy of [OrderDishOption] with given parameters
  OrderDishOption copyWith({
    String? id,
    String? dishOrderId,
    String? optionId,
  }) {
    return OrderDishOption(
      id: id ?? this.id,
      dishOrderId: dishOrderId ?? this.dishOrderId,
      optionId: optionId ?? this.optionId,
    );
  }

  @override
  List<Object?> get props => [id, dishOrderId, optionId];
}
