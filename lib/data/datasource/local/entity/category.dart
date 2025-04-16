import 'package:floor/floor.dart';

@Entity(tableName: 'category')
class Category {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final int color;

  Category(this.name, this.color, {this.id});

  Category copyWith({
    int? id,
    String? name,
    int? color,
  }) {
    return Category(
      name ?? this.name,
      color ?? this.color,
      id: id ?? this.id,
    );
  }
}
