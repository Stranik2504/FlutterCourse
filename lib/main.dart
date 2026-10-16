import 'package:flutter/material.dart';
import 'package:proj_start/pages/home_page.dart';
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
        Routes.home: (_) => const HomePage(),
        Routes.loading: (_) => const LoadingPage(),
        Routes.login: (_) => const LoginPage(),
        Routes.register: (_) => const RegisterPage(),
        Routes.profile: (_) => const ProfilePage(),
        "${Routes.detail}/1": (_) => const DetailPage(number: 1),
        "${Routes.detail}/2": (_) => const DetailPage(number: 2),
        "${Routes.detail}/3": (_) => const DetailPage(number: 3),
      },
    );
  }
}


