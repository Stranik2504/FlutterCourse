import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_start/di/di.dart';
import 'package:proj_start/pages/home/bloc/algo_bloc.dart';
import 'package:proj_start/pages/home/home_page.dart';
import 'package:proj_start/pages/loading_page.dart';
import 'package:proj_start/pages/login_page.dart';
import 'package:proj_start/pages/register_page.dart';
import 'package:proj_start/pages/profile_page.dart';
import 'package:proj_start/pages/detail_page.dart';
import 'package:proj_start/routes.dart';
import 'package:proj_start/theme/app_theme.dart';
import 'package:proj_start/theme/theme_cubit.dart';

void main() {
  setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Алгоритмы сортировки',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            initialRoute: Routes.loading,
            routes: {
              Routes.home: (context) => BlocProvider(
                create: (_) => getIt<AlgoBloc>()..add(const LoadAlgoEvent()),
                child: const HomePage(),
              ),
              Routes.loading: (_) => const LoadingPage(),
              Routes.login: (_) => const LoginPage(),
              Routes.register: (_) => const RegisterPage(),
              Routes.profile: (_) => const ProfilePage(),
              Routes.detail: (_) => const DetailPage(),
            },
          );
        }
      ),
    );
  }
}


