// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../invoice_dish_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDishOption _$InvoiceDishOptionFromJson(Map<String, dynamic> json) =>
    InvoiceDishOption(
      id: json['id'] as String?,
      invoiceDishId: json['invoice_dish_id'] as String,
      optionId: json['option_id'] as String,
    );

Map<String, dynamic> _$InvoiceDishOptionToJson(InvoiceDishOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice_dish_id': instance.invoiceDishId,
      'option_id': instance.optionId,
    };
