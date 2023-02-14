import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_server/server/models/typedef.dart';
import 'package:uuid/uuid.dart';

part 'order.g.dart';

enum OrderStatus {
  prepare,
  shipping,
  served,
  paid,
}

@JsonSerializable()
class Order extends Equatable {
  /// {macro Order}
  Order({
    String? id,
    required this.tableId,
    required this.time,
    required this.items,
    required this.status,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  @JsonKey(name: 'table_id')
  final int tableId;

  final DateTime time;

  final Map<String, int> items;

  final OrderStatus status;

  /// Deserializes the given [JsonMap] into a [Order].
  static Order fromJson(JsonMap json) {
    return _$OrderFromJson(json);
  }

  /// Converts this [Order] into a [JsonMap].
  JsonMap toJson() => _$OrderToJson(this);

  /// Returns a copy of [Order] with given parameters
  Order copyWith({
    String? id,
    int? tableId,
    DateTime? time,
    Map<String, int>? items,
    OrderStatus? status,
  }) {
    return Order(
      id: id ?? this.id,
      tableId: tableId ?? this.tableId,
      time: time ?? this.time,
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [id, tableId, time, items, status];
}
