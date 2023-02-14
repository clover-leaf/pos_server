// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String?,
      tableId: json['table_id'] as int,
      time: DateTime.parse(json['time'] as String),
      items: Map<String, int>.from(json['items'] as Map),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'table_id': instance.tableId,
      'time': instance.time.toIso8601String(),
      'items': instance.items,
      'status': _$OrderStatusEnumMap[instance.status]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.prepare: 'prepare',
  OrderStatus.shipping: 'shipping',
  OrderStatus.served: 'served',
  OrderStatus.paid: 'paid',
};
