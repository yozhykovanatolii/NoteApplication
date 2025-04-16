import 'package:flutter/material.dart';

void showAlertDialog<T>({
  required BuildContext context,
  T? item,
  required Widget Function(T? item) builder,
}) {
  showDialog(
    context: context,
    builder: (context) => builder(item),
  );
}
