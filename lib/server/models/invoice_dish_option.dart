import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_server/server/models/typedef.dart';
import 'package:uuid/uuid.dart';

part 'gen/invoice_dish_option.g.dart';

@JsonSerializable()
class InvoiceDishOption extends Equatable {
  /// {macro InvoiceDishOption}
  InvoiceDishOption({
    String? id,
    required this.invoiceDishId,
    required this.optionId,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  @JsonKey(name: 'invoice_dish_id')
  final String invoiceDishId;

  @JsonKey(name: 'option_id')
  final String optionId;

  /// Deserializes the given [JsonMap] into a [InvoiceDishOption].
  static InvoiceDishOption fromJson(JsonMap json) {
    return _$InvoiceDishOptionFromJson(json);
  }

  /// Converts this [InvoiceDishOption] into a [JsonMap].
  JsonMap toJson() => _$InvoiceDishOptionToJson(this);

  /// Returns a copy of [InvoiceDishOption] with given parameters
  InvoiceDishOption copyWith({
    String? id,
    String? invoiceDishId,
    String? optionId,
  }) {
    return InvoiceDishOption(
      id: id ?? this.id,
      invoiceDishId: invoiceDishId ?? this.invoiceDishId,
      optionId: optionId ?? this.optionId,
    );
  }

  @override
  List<Object?> get props => [id, invoiceDishId, optionId];
}
