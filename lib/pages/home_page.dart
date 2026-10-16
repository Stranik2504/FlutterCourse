import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proj_start/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _screens= [
    MyHomePage(title: 'Алгоритмы сортировки'),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.deepPurple.shade50,
        indicatorColor: Colors.deepPurple.shade100,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        animationDuration: const Duration(milliseconds: 500),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
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
            LayoutBuilder(
              builder: (context, constraints) {
                final isDesktopLayout = constraints.maxWidth > 600;
                final double platformPadding = (kIsWeb ||
                        defaultTargetPlatform == TargetPlatform.windows ||
                        defaultTargetPlatform == TargetPlatform.macOS ||
                        defaultTargetPlatform == TargetPlatform.linux)
                    ? 16.0
                    : 8.0;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: isDesktopLayout ? platformPadding : 0,
                    bottom: isDesktopLayout ? platformPadding : 0,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isDesktopLayout ? 2 : 1,
                    mainAxisExtent: isDesktopLayout ? 57 : 55,
                    mainAxisSpacing: isDesktopLayout ? platformPadding : 8,
                    crossAxisSpacing: isDesktopLayout ? platformPadding : 0,
                  ),
                  itemCount: terms.length,
                  itemBuilder: (context, index) {
                    final term = terms[index];

                    return Card(
                      margin: EdgeInsets.zero,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        minTileHeight: 0,
                        title: Text(
                          term,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'CascadiaCode',
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/detail/${index + 1}');
                        },
                      ),
                    );
                  },
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