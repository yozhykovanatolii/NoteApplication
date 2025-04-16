import 'package:flutter/material.dart';
import 'package:note_application/data/datasource/local/entity/category.dart';
import 'package:note_application/presentation/viewmodel/note/note_view_model.dart';
import 'package:provider/provider.dart';

class CategoryChoiceChip extends StatelessWidget {
  final Category category;
  final bool isShouldUpdateNotes;

  const CategoryChoiceChip({
    super.key,
    required this.category,
    this.isShouldUpdateNotes = true,
  });

  @override
  Widget build(BuildContext context) {
    final noteViewModel = context.watch<NoteViewModel>();
    return ChoiceChip(
      label: Text(category.name),
      selectedColor: Color(category.color),
      selected:
          noteViewModel.selectedCategoryId == category.id,
      showCheckmark: false,
      onSelected:
          (_) => noteViewModel.onSelectedCategoryChip(
            category.id,
            shouldUpdateNotes: isShouldUpdateNotes,
          ),
    );
  }
}
