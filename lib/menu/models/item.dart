import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_server/menu/models/typedef.dart';
import 'package:uuid/uuid.dart';

part 'item.g.dart';

@JsonSerializable()

/// Item model for an API providing to access broker
class Item extends Equatable {
  /// {macro Item}
  Item({
    String? id,
    required this.name,
    required this.price,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;
  final String name;
  final double price;

  /// Deserializes the given [JsonMap] into a [Item].
  static Item fromJson(JsonMap json) {
    return _$ItemFromJson(json);
  }

  /// Converts this [Item] into a [JsonMap].
  JsonMap toJson() => _$ItemToJson(this);

  /// Returns a copy of [Item] with given parameters
  Item copyWith({
    String? id,
    String? name,
    double? price,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [id, name, price];
}
