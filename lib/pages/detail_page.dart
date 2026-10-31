import 'package:flutter/material.dart';

import '../models/algo.dart';
import '../theme/theme_toggle_action.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final algo = ModalRoute.of(context)!.settings.arguments as Algo;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(algo.subTitle)),
        actions: const [
          ThemeToggleAction(), // добавили кнопку
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                algo.imgPath,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              algo.description,
              style: Theme.of(context).textTheme.bodyLarge
            ),
          ],
        ),
      )
    );
  }
}