// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_dish_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDishOption _$OrderDishOptionFromJson(Map<String, dynamic> json) =>
    OrderDishOption(
      id: json['id'] as String?,
      dishOrderId: json['dish_order_id'] as String,
      optionId: json['option_id'] as String,
    );

Map<String, dynamic> _$OrderDishOptionToJson(OrderDishOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dish_order_id': instance.dishOrderId,
      'option_id': instance.optionId,
    };
