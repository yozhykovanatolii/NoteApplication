import 'package:flutter/material.dart';

class DeleteIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteIconButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.red,
      icon: const Icon(Icons.delete),
    );
  }
}
