import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_application/core/navigation/app_routes.dart';
import 'package:note_application/core/widgets/common_dialog.dart';
import 'package:note_application/data/datasource/local/entity/category.dart';
import 'package:note_application/presentation/page/category_detail/category_detail.dart';
import 'package:note_application/presentation/page/manage_categories/widgets/category_list_tile.dart';
import 'package:note_application/presentation/viewmodel/category/category_view_model.dart';
import 'package:provider/provider.dart';

class ManageCategoriesPage extends StatelessWidget {
  const ManageCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(AppRoutes.homePath),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Manage categories'),
      ),
      body: Consumer<CategoryViewModel>(
        builder: (_, viewModel, __) {
          final categories = viewModel.categories;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryListTile(
                onTap: () {
                  showAlertDialog<Category>(
                    context: context,
                    item: categories[index],
                    builder:
                        (category) => CategoryDetail(
                          category: category,
                        ),
                  );
                },
                category: categories[index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog<Category>(
            context: context,
            item: null,
            builder:
                (category) =>
                    CategoryDetail(category: category),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
