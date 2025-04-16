import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_application/core/navigation/app_router.dart';
import 'package:note_application/core/theme/app_theme.dart';
import 'package:note_application/di/get_it_setup.dart';
import 'package:note_application/presentation/viewmodel/category/category_view_model.dart';
import 'package:note_application/presentation/viewmodel/note/note_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetItSetup.setupDependencies();
  await GetIt.instance.allReady();
  AppRouter.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) => GetIt.instance<CategoryViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<NoteViewModel>(),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.setTheme(),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
