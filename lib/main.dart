import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_start/pages/home/bloc/algo_bloc.dart';
import 'package:proj_start/pages/home/home_page.dart';
import 'package:proj_start/pages/loading_page.dart';
import 'package:proj_start/pages/login_page.dart';
import 'package:proj_start/pages/register_page.dart';
import 'package:proj_start/pages/profile_page.dart';
import 'package:proj_start/pages/detail_page.dart';
import 'package:proj_start/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: Routes.loading,
      routes: {
        Routes.home: (context) => BlocProvider(
          create: (_) => AlgoBloc()..add(const LoadAlgoEvent()),
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
}


