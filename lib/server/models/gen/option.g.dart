// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      id: json['id'] as String?,
      dishOptionId: json['dish_option_id'] as String,
      name: json['name'] as String,
      additionalCharge: (json['additional_charge'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'dish_option_id': instance.dishOptionId,
      'name': instance.name,
      'additional_charge': instance.additionalCharge,
    };
