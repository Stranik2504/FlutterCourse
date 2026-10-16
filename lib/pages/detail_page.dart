import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.number});
  final int number;

  @override
  State<DetailPage> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  static const List<String> _titles = [
    "Пузырьковая сортировка. 1",
    "Сортировка вставками. 2",
    "Quick sort. 3"
  ];

  static const List<String> _descriptions = [
    "Пузырьковая сортировка — это простой алгоритм сортировки, который многократно проходит по списку, сравнивает соседние элементы и меняет их местами, если они находятся в неправильном порядке. Проходы по списку повторяются до тех пор, пока список не будет отсортирован.",
    "Сортировка вставками — это алгоритм сортировки, который постепенно формирует отсортированный массив, вставляя каждый новый элемент на правильную позицию.",
    "Quick sort — это эффективный алгоритм сортировки, который использует стратегию «разделяй и властвуй». Он выбирает определенный элемент (опорный) и разделяет массив на две части: элементы меньше опорного и элементы больше опорного."
  ];

  int getNumber() { return widget.number - 1; }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 157, 255, 0),
        title: Center(child: Text(_titles[getNumber()])),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/imgs/${(getNumber() + 1)}.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _descriptions[getNumber()],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'CascadiaCode',
              )
            ),
          ],
        ),
      )
    );
  }
}