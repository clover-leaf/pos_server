// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dish_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishOption _$DishOptionFromJson(Map<String, dynamic> json) => DishOption(
      id: json['id'] as String?,
      dishId: json['dish_id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$OptionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$DishOptionToJson(DishOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dish_id': instance.dishId,
      'name': instance.name,
      'type': _$OptionTypeEnumMap[instance.type]!,
    };

const _$OptionTypeEnumMap = {
  OptionType.singleChoice: 'singleChoice',
  OptionType.multiChoice: 'multiChoice',
};
