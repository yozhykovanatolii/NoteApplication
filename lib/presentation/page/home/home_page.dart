import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_application/core/navigation/app_routes.dart';
import 'package:note_application/core/widgets/category_choice_chip.dart';
import 'package:note_application/core/widgets/common_dialog.dart';
import 'package:note_application/data/datasource/local/entity/note.dart';
import 'package:note_application/presentation/page/home/widgets/error_text_widget.dart';
import 'package:note_application/presentation/page/home/widgets/loading_progress_indicatior.dart';
import 'package:note_application/presentation/page/home/widgets/note_card.dart';
import 'package:note_application/presentation/page/note_detail/note_detail_page.dart';
import 'package:note_application/presentation/viewmodel/category/category_view_model.dart';
import 'package:note_application/presentation/viewmodel/note/note_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 50,
        ),
        child: Column(
          children: [
            SearchBar(
              leading: const Icon(Icons.search),
              hintText: 'Search your note...',
              onChanged:
                  context.read<NoteViewModel>().searchNotes,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: Consumer<CategoryViewModel>(
                      builder: (_, categoryViewModel, __) {
                        final categories =
                            categoryViewModel.categories;
                        return ListView.separated(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return CategoryChoiceChip(
                              category: categories[index],
                            );
                          },
                          separatorBuilder: (_, __) {
                            return const SizedBox(width: 8);
                          },
                        );
                      },
                    ),
                  ),
                ),
                FloatingActionButton.small(
                  onPressed:
                      () => context.go(
                        AppRoutes.manageCategoriesPath,
                      ),
                  child: const Icon(Icons.category),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<NoteViewModel>(
                builder: (_, noteViewModel, __) {
                  final noteViewState =
                      noteViewModel.noteViewState;
                  if (noteViewState.isLoading) {
                    return const LoadingProgressIndicatior();
                  }
                  if (noteViewState
                      .errorMessage
                      .isNotEmpty) {
                    return ErrorTextWidget(
                      message: noteViewState.errorMessage,
                    );
                  }
                  return ListView.separated(
                    itemCount: noteViewState.notes.length,
                    itemBuilder: (_, index) {
                      final note =
                          noteViewState.notes[index];
                      return NoteCard(
                        note: note,
                        onTap: () {
                          showAlertDialog<Note>(
                            context: context,
                            item: note,
                            builder:
                                (note) => NoteDetailPage(
                                  note: note,
                                ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(height: 10);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog<Note>(
            context: context,
            item: null,
            builder: (note) => NoteDetailPage(note: note),
          );
        },
        heroTag: 'note',
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
