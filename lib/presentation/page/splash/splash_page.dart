import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_application/core/navigation/app_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.scale(
        backgroundColor: Colors.blue,
        childWidget: const Center(
          child: Icon(
            Icons.note,
            size: 100,
            color: Colors.white,
          ),
        ),
        animationDuration: const Duration(
          milliseconds: 1500,
        ),
        onEnd: () => context.go(AppRoutes.homePath),
      ),
    );
  }
}
