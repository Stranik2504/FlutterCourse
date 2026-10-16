import 'package:flutter/material.dart';
import 'package:proj_start/routes.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPage();
}

class _LoadingPage extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    //Имитация инициализации (загрузка настроек, БД)

    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  'assets/imgs/2.jpg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Алгоритмы сортировки",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'CascadiaCode',
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}