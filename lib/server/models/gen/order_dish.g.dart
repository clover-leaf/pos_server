// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDish _$OrderDishFromJson(Map<String, dynamic> json) => OrderDish(
      id: json['id'] as String?,
      orderId: json['order_id'] as String,
      dishId: json['dish_id'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$OrderDishToJson(OrderDish instance) => <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'dish_id': instance.dishId,
      'amount': instance.amount,
    };
