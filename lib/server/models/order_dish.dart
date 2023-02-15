import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_server/server/models/typedef.dart';
import 'package:uuid/uuid.dart';

part 'gen/order_dish.g.dart';

@JsonSerializable()
class OrderDish extends Equatable {
  /// {macro OrderDish}
  OrderDish({
    String? id,
    required this.orderId,
    required this.dishId,
    required this.amount,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  @JsonKey(name: 'order_id')
  final String orderId;

  @JsonKey(name: 'dish_id')
  final String dishId;

  final int amount;

  /// Deserializes the given [JsonMap] into a [OrderDish].
  static OrderDish fromJson(JsonMap json) {
    return _$OrderDishFromJson(json);
  }

  /// Converts this [OrderDish] into a [JsonMap].
  JsonMap toJson() => _$OrderDishToJson(this);

  /// Returns a copy of [OrderDish] with given parameters
  OrderDish copyWith({
    String? id,
    String? orderId,
    String? dishId,
    int? amount,
  }) {
    return OrderDish(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      dishId: dishId ?? this.dishId,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object?> get props => [id, orderId, dishId, amount];
}
