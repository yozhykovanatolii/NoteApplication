import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final int? maxLines;
  final int? minLines;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.errorText,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      style: const TextStyle(fontSize: 18),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorText: errorText,
      ),
      onChanged: onChanged,
    );
  }
}
