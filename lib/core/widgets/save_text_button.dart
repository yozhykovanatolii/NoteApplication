import 'package:flutter/material.dart';

class SaveTextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveTextButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(
          Colors.blue,
        ),
      ),
      child: const Text(
        'Save',
        style: TextStyle(fontSize: 19),
      ),
    );
  }
}
