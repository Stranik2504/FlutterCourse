import 'package:flutter/material.dart';
import 'package:proj_start/pages/login_page.dart';
import 'package:proj_start/pages/register_page.dart';
import 'package:proj_start/pages/profile_page.dart';

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
      // home: const MyHomePage(title: 'Соритровка'),
      home: const LoginPage(),
      // home: const RegisterPage(),
      // home: const ProfilePage(),
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
  int num = 1;
  static const List<String> terms = [
    "1. Пузырьковая сортировка",
    "2. Сортировка вставками",
    "3. Quick sort",
  ];

  Container getImg(int ind) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/imgs/$ind.jpg',
          width: 220,
          height: 120,
          fit: BoxFit.fill,
        ),
      )
    );
  }

  void changeImg() {
    setState(() {
      num++;

      if (num > 5) {
        num = 1;
      }
    });
  }

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
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'CascadiaCode',
                  ),
                )
            ),
            const Center(
              child: Text(
                'Мы визуализируем и объясняем алгоритмы сортировки. '
                'Наша цель — разложить по полочкам порядок, сложность и логику работы с данными.',
                style: TextStyle(fontSize: 16, fontFamily: 'CascadiaCode',),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  getImg(1),
                  getImg(2),
                  getImg(3),
                  getImg(4),
                  getImg(5),
                ],
              ),
            ),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: terms.length,
              itemBuilder: (context, index) {
                var term= terms[index];

                return Card(
                  child:
                  ListTile(
                    title: Text(term, style: TextStyle(fontSize: 18, fontFamily: 'CascadiaCode'),),                             // текст
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(term),
                          duration: const Duration(seconds: 3),
                        )
                      );
                    },
                  ),
                );
              },
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
