import 'package:flutter/material.dart';
import 'package:note_application/core/widgets/delete_icon_button.dart';
import 'package:note_application/data/datasource/local/entity/note.dart';
import 'package:note_application/presentation/viewmodel/note/note_view_model.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      shadowColor: Colors.blue,
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text(
            note.title,
            style: textTheme.bodyMedium,
          ),
          subtitle: Text(
            note.body,
            style: textTheme.labelSmall,
          ),
          trailing: DeleteIconButton(
            onPressed:
                () => context
                    .read<NoteViewModel>()
                    .deleteNote(note),
          ),
        ),
      ),
    );
  }
}
