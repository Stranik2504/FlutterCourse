import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_start/pages/home/bloc/algo_bloc.dart';
import 'package:proj_start/pages/profile_page.dart';

import '../../mock/algo_data.dart';
import '../../routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    MyHomePageBloc(title: 'Алгоритмы сортировки'),
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

class MyHomePageBloc extends StatefulWidget {
  const MyHomePageBloc({super.key, required this.title});
  final String title;

  @override
  State<MyHomePageBloc> createState() => _MyHomePageBlocState();
}

class _MyHomePageBlocState extends State<MyHomePageBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AlgoBloc, AlgoState>(
        //Перестройка UI при изменении состояния
        builder: (context, state) {
          switch (state) {
            case AlgoInitial():
              return const Center(child: Text('Данные еще не загружены'));

            case AlgoLoading():
              return const Center(child: CircularProgressIndicator());

            case AlgoError(:final message):
              return Center(child: Text(message));

            case AlgoLoaded(:final terms):
              if (terms.isEmpty) {
                return const Center(child: Text('Список пуст'));
              }

              return MyHomePage(title: widget.title);
          }
        },
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
                  itemCount: alogs.length,
                  itemBuilder: (context, index) {
                    final algo = alogs[index];

                    return Card(
                      margin: EdgeInsets.zero,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        minTileHeight: 0,
                        title: Text(
                          algo.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'CascadiaCode',
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.detail,
                            arguments: algo
                          );
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