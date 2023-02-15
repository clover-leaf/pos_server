import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pos_server/server/models/typedef.dart';
import 'package:uuid/uuid.dart';

part 'gen/category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  /// {macro Category}
  Category({
    String? id,
    required this.name,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;

  final String name;

  /// Deserializes the given [JsonMap] into a [Category].
  static Category fromJson(JsonMap json) {
    return _$CategoryFromJson(json);
  }

  /// Converts this [Category] into a [JsonMap].
  JsonMap toJson() => _$CategoryToJson(this);

  /// Returns a copy of [Category] with given parameters
  Category copyWith({
    String? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
