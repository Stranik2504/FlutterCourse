import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Соритровка'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 157, 255, 0),
        title: Center(child: Text(widget.title)),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text(
                  'Алгоритмы сортировки',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
            ),
            const Center(
              child: Text(
                'Мы визуализируем и объясняем алгоритмы сортировки. '
                'Наша цель — разложить по полочкам порядок, сложность и логику работы с данными.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/algo.jpg',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(child: Column(crossAxisAlignment: .start,
                  children: [
                    Text("1. Пузырьковая сортировка", style: TextStyle(fontSize: 18)),
                    Text("2. Сортировка вставками", style: TextStyle(fontSize: 18)),
                    Text("3. Quick sort", style: TextStyle(fontSize: 18)),
                  ],
                ))
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.groups, color: Colors.blue), // иконка слева
                SizedBox(width: 8), // отступ между иконкой и текстом
                Text('Баранов Ю. С. ИКБО-61-23', style: TextStyle(fontSize: 18)),
              ],
            ), //Row
          ],
        ), //Column
      ),
    );
  }
}
