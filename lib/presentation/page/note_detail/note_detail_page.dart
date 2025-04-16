import 'package:flutter/material.dart';
import 'package:note_application/core/widgets/category_choice_chip.dart';
import 'package:note_application/core/widgets/custom_text_field.dart';
import 'package:note_application/core/widgets/save_text_button.dart';
import 'package:note_application/data/datasource/local/entity/note.dart';
import 'package:note_application/presentation/viewmodel/category/category_view_model.dart';
import 'package:note_application/presentation/viewmodel/note/note_view_model.dart';
import 'package:provider/provider.dart';

class NoteDetailPage extends StatefulWidget {
  final Note? note;

  const NoteDetailPage({super.key, this.note});

  @override
  State<NoteDetailPage> createState() =>
      _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late NoteViewModel noteViewModel;
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    noteViewModel = context.read<NoteViewModel>();
    noteViewModel.setEditingNote(widget.note);
    _titleController.text = widget.note?.title ?? '';
    _bodyController.text = widget.note?.body ?? '';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Create a new note',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: [
            SizedBox(
              height: 40,
              child: Consumer<CategoryViewModel>(
                builder: (_, categoryViewModel, __) {
                  final categories =
                      categoryViewModel.categories;
                  return ListView.separated(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryChoiceChip(
                        category: categories[index],
                        isShouldUpdateNotes: false,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                  );
                },
              ),
            ),
            Consumer<NoteViewModel>(
              builder: (_, noteViewModel, __) {
                return CustomTextField(
                  controller: _titleController,
                  hintText: 'Title',
                  onChanged: noteViewModel.setNoteTitle,
                  errorText: noteViewModel.errorNoteTitle,
                );
              },
            ),
            SizedBox(
              height: 100,
              child: CustomTextField(
                controller: _bodyController,
                hintText: 'Type something here...',
                maxLines: null,
                minLines: 6,
                onChanged: noteViewModel.setNoteBody,
              ),
            ),
          ],
        ),
      ),
      actions: [
        SaveTextButton(
          onPressed:
              () => noteViewModel.saveNote(widget.note),
        ),
      ],
    );
  }
}
