import 'package:flutter/material.dart';

class LoadingProgressIndicatior extends StatelessWidget {
  const LoadingProgressIndicatior({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.blue),
    );
  }
}
