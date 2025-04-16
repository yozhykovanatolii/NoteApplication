import 'package:flutter/material.dart';
import 'package:note_application/core/widgets/delete_icon_button.dart';
import 'package:note_application/data/datasource/local/entity/category.dart';
import 'package:note_application/presentation/viewmodel/category/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryListTile extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryListTile({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CategoryViewModel>();
    return InkWell(
      onTap: onTap,
      splashColor: Colors.blue,
      child: ListTile(
        leading: Icon(
          Icons.circle,
          color: Color(category.color),
        ),
        title: Text(
          category.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: DeleteIconButton(
          onPressed:
              () => viewModel.deleteCategory(category),
        ),
      ),
    );
  }
}
