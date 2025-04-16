import 'package:flutter/material.dart';
import 'package:note_application/core/widgets/custom_text_field.dart';
import 'package:note_application/core/widgets/save_text_button.dart';
import 'package:note_application/data/datasource/local/entity/category.dart';
import 'package:note_application/presentation/page/category_detail/widgets/color_button.dart';
import 'package:note_application/presentation/viewmodel/category/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetail extends StatefulWidget {
  final Category? category;

  const CategoryDetail({super.key, this.category});

  @override
  State<CategoryDetail> createState() =>
      _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  late final CategoryViewModel viewModel;
  final colors = [
    0xFFF44336,
    0xFFFBC02D,
    0xFFFF9800,
    0xFF4CAF50,
    0xFF2196F3,
    0xFF9C27B0,
  ];
  final TextEditingController _nameCategoryController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = context.read<CategoryViewModel>();
    viewModel.setEditingCategory(widget.category);
    _nameCategoryController.text =
        widget.category?.name ?? '';
  }

  @override
  void dispose() {
    _nameCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Create a new category',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: [
            Consumer<CategoryViewModel>(
              builder: (_, viewModel, __) {
                return CustomTextField(
                  controller: _nameCategoryController,
                  hintText: 'Type something...',
                  onChanged: viewModel.setCategoryName,
                  errorText: viewModel.errorText,
                );
              },
            ),
            Text(
              'Category color',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return Consumer<CategoryViewModel>(
                    builder: (_, categoryViewModel, __) {
                      return ColorButton(
                        isSelected:
                            categoryViewModel
                                .selectedColorIndex ==
                            index,
                        onTap:
                            () => categoryViewModel
                                .selectColor(
                                  index,
                                  colors[index],
                                ),
                        colorHex: colors[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        SaveTextButton(
          onPressed: () {
            viewModel.setCategory(widget.category);
          },
        ),
      ],
    );
  }
}
