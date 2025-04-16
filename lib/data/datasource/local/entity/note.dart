import 'package:floor_annotation/floor_annotation.dart';
import 'package:note_application/data/datasource/local/entity/category.dart';

@Entity(
  tableName: 'note',
  foreignKeys: [
    ForeignKey(
      childColumns: ['category_id'],
      parentColumns: ['id'],
      entity: Category,
    ),
  ],
)
class Note {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final String body;
  @ColumnInfo(name: 'category_id')
  final int categoryId;

  Note({
    this.id,
    required this.title,
    required this.body,
    required this.categoryId,
  });

  Note copyWith({
    String? title,
    String? body,
    int? categoryId,
    int? id,
  }) {
    return Note(
      title: title ?? this.title,
      body: body ?? this.body,
      categoryId: categoryId ?? this.categoryId,
      id: this.id,
    );
  }
}
